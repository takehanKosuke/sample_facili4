class LessonsUsersController < ApplicationController
  def destroy
    lesson_user = LessonUser.find(params[:id])
    if lesson_user.user_id == current_user.id
      lesson_user.destroy
    end
  redirect_to "/"
  end
end
