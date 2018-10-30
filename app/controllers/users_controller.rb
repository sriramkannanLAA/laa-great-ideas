class UsersController < ApplicationController
  before_action :require_admin
  before_action :set_user, only: [:show, :toggle_admin]

  def index
    @users = User.all
  end

  def show
  end

  def toggle_admin
    @user.admin = !@user.admin
    if @user.save
      redirect_to user_path(@user), notice: 'Admin status updated'
    else
      redirect_to user_path(@user), notice: 'Unable to update admin status'
    end
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
