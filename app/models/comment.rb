class Comment < ActiveRecord::Base
  attr_accessible :contents

  belongs_to :user
  belongs_to :commentable, :polymorphic => true

  validates :contents, :presence => true
  validates_associated :user
  validates_associated :commentable
end
