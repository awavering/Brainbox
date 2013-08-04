class Assignment < ActiveRecord::Base
  attr_accessible :name, :description, :category, :due, :late, :super_files

  has_many :submissions
  has_many :comments, :as => :commentable
  has_many :super_files, :as => :fileable #fileable means it can have an attached file

  validates :name, :presence => true
  validates :category, :presence => true
  validates :due, :presence => true
  validates_associated :section

  def files
    
  end

  belongs_to :section

end
