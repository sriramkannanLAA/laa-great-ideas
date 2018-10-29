class UsersController < ApplicationController
  before_action :require_admin
  before_action :set_user, only: [:show]

  def index
    @users = User.all
  end

  def show
  end

  private

  def require_admin
    unless current_user.admin?
      redirect_to ideas_path, notice: 'You are not authorized to view users'
    end
  end

  def set_user
    @user = User.find(params[:id]||params[:user_id])
  end

end
