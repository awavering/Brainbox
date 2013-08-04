class Course < ActiveRecord::Base
  attr_accessible :name

  has_many :sections
  belongs_to :school

  validates :name, :presence => true
  validates_associated :school
end
