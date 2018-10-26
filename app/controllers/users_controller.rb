class UsersController < ApplicationController
  before_action :require_admin

  def index
    @users = User.all
  end

  private

  def require_admin
    unless current_user.admin?
      redirect_to ideas_path, notice: 'You are not authorized to view users'
    end
  end

end
