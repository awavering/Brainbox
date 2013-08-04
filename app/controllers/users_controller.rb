class UsersController < ApplicationController

  # TODO: must implement strict policy controls here, or figure out how the hell Devise does it

  def create
    super
  end

  def index
    @users = User.all
    @users_by_category = {}
    [:admin, :teacher, :student, :parent].each do |role|
      @users_by_category[role] = @users.select{ |u| u.has_role? role }
    end
    @tab = 'Students'

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  def show
    @user = User.find(params[:id])
    render 'show_modal', :layout => false
  end

  def new
    @user = User.new
    render 'form_modal', :layout => false
  end
end
