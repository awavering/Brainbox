class Section < ActiveRecord::Base
	attr_accessible :name, :start, :finish, :description, :location, :capacity, :announcements

  has_and_belongs_to_many :teachers, :class_name => :User, :join_table => :teachers_sections
  has_and_belongs_to_many :students, :class_name => :User, :join_table => :students_sections
  belongs_to :course
  has_many :assignments

  validates :name, :presence => true
  validates :start, :presence => true
  validates :finish, :presence => true

  def can_update attribute
    self.teachers.include? @current_user
  end

  def can_delete
    self.teachers.include? @current_user
  end

  # teachers
  def add_teacher user
    if not self.teachers.include? user
      self.teachers << user
    end
  end

  def remove_teacher user
    self.teachers.delete user
  end

  # students
  def add_student user
    if not self.students.include? user
      self.students << user
    end
  end

  def remove_student user
    self.students.delete user
  end

end
