class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_user!
  before_filter :initialize_sections

  def initialize_sections
    return if not user_signed_in?
    @current_user = current_user
    @sections_taking = current_user.sections_taking
    @sections_teaching = current_user.sections_teaching
  end
end
