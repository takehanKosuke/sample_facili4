class UsersController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    current_user.update(update_params)
    redirect_to "/"
  end

  private
  def update_params
    params.require(:user).permit(:department_id, :faculty_id, :gread_id)
  end
end
