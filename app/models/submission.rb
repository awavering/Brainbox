class Submission < ActiveRecord::Base
  attr_accessible :note, :submitted, :super_files

  belongs_to :user
  belongs_to :assignment
  has_many :comments, :as => :commentable
  has_many :super_files, :as => :fileable

  before_create :add_submission_time

  def add_submission_time() self.submitted = Time.now end
end
