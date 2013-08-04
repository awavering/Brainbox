class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  # this is all Devise stuff
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  # BBX data
  attr_accessible :first, :last, :roles, :preferences

  # roles store primary role of user; can be expanded into multiple roles
  ROLES = [:super, :admin, :teacher, :student, :parent]
  serialize :roles, JSON

  # stores app preferences of user
  serialize :preferences, JSON

  # BBX links
  has_and_belongs_to_many :schools
  has_many :submissions
  has_many :comments
  has_many :messages
  has_many :files

  has_and_belongs_to_many :parents, :class_name => :User, :association_foreign_key => :parent_id, :join_table => :parents_users
  has_and_belongs_to_many :children, :class_name => :User, :association_foreign_key => :child_id, :join_table => :children_users

  has_and_belongs_to_many :sections_teaching, :class_name => :Section, :join_table => :teachers_sections
  has_and_belongs_to_many :sections_taking, :class_name => :Section, :join_table => :students_sections

  after_initialize :ensure_defaults

  # authorizations
  def can_update current_user, attribute
    current_user == self
  end

  def can_delete current_user
    current_user == self
  end

  # initializers
  def ensure_defaults
    if self.preferences.nil?
      self.preferences = {}
      self.preferences["nickname"] = ""

      self.roles ||= []

      self.save
    end
  end

  # roles
  def has_role? role
    self.roles.include? role.downcase.to_s
  end

  def add_role role
    role = role.downcase
    self.roles << role.to_s if not has_role?(role) and ROLES.include?(role)
    self.save
  end

  def remove_role role
    role = role.downcase
    self.roles.select!{ |r| r != role }
    self.save
  end

  def roles_to_s
    roles.join(",")
  end

  # relationships
  def add_child user
    if not self.children.include? user and self != user
      self.children << user
    end
  end

  def remove_child user
    self.children.delete user
  end

  def add_parent user
    if not self.parents.include? user and self != user
      self.parents << user
    end
  end

  def remove_parent user
    self.parents.delete user
  end

  # sections
  def enroll_in section
    if not self.sections_taking.include? section
      self.sections_taking << section
    end
  end

  def unenroll_from section
    self.sections_taking.delete section
  end

  def instruct section
    if not self.sections_teaching.include? section
      self.sections_teaching << section
    end
  end

  def vacate_instructor_position section
    self.sections_teaching.delete section
  end
end

# permissions modification
class User < ActiveRecord::Base
  # depends on deployment: school (admin rights only to admins) vs universal (admin rights to teachers)
  # actions:
  def i_can? action, obj = nil
    # supers can do all
    return true if self.has_role? :super

    # check for broad permission, given by specified yml file
    broad_permission = false
    action += 's'
    obj_class = (obj.class == Class) ? obj : obj.class
    user.roles.each do |role|
      broad_permission = true if config.permissions[role][action].include? obj_class
    end

    # if broad permission hasn't been granted, permission is denied
    if not broad_permission
      unauthorized_access! user, action, obj
      return false
    end

    # specific permission will be given by model
    return true
  end

  def self.unauthorized_access! action = nil, obj = nil
    Rails.logger.warn "Caught in model:"
    Rails.logger.warn "User #{self.first} #{self.last} (#{self.id}) has been denied the action #{action} on #{obj}, #{obj.class} #{obj.id}"
    raise AuthorizationException
  end

  # execute block of code if action is allowable
  def if_i_can action, obj
    if i_can? self, action, obj
      yield
    else
      unauthorized_access! self, action, obj
    end
  end
end

# each model must implement can_update(attribute) and can_delete
class ActiveRecord::Base
  #before_save :check_permissions_on_save
  #before_destroy :check_permission_to_delete

  def check_permissions_on_save
    self.changed.each do |attribute|
      if not can_update attribute
        PermissionHelper.unauthorized_access!
        return false
      end
    end
  end

  def check_permission_to_delete
    if not can_delete
      PermissionHelper.unauthorized_access!
      return false 
    end
  end
end