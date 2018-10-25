class UsersController < ApplicationController

  def list
    if current_user.admin?
      @users = User.all
    else
      redirect_to ideas_path, notice: 'You are not authorized to view users'
    end
  end
  
end
