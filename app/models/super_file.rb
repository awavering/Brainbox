class SuperFile < ActiveRecord::Base
  attr_accessible :name, :size, :mimetype

  belongs_to :user
  belongs_to :fileable

  # actual file
  attr_accessible :url
  #has_attached_file :file, FileStore::settings

  validates :name, :presence => true
  validates :mimetype, :presence => true
  validates :size, :presence => true, :numericality => { :only_integer => true }
   
end
