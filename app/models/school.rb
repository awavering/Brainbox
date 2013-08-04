class School < ActiveRecord::Base
  attr_accessible :name, :location, :logo, :style

  has_and_belongs_to_many :users

  validates :name, :presence => true
end
