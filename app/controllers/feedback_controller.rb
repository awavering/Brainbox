class FeedbackController < ApplicationController

  def create
    puts params
    feedback_string=params[:m]
    BrainboxMailer.feedback_email(current_user, feedback_string).deliver
  end

end