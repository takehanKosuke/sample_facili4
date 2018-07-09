class LessonsUsersController < ApplicationController
  def destroy
    lesson_user = LessonUser.find(params[:id])
    lesson_users = LessonUser.where('user_id = ? and created_at = ?',current_user.id, lesson_user.created_at)
    lesson_users.each do |lesson_user|
      if lesson_user.user_id == current_user.id
        lesson_user.destroy
      end
    end
  redirect_to "/"
  end
end
