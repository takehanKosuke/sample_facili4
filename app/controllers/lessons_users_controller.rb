class LessonsUsersController < ApplicationController
  def destroy
    lesson_user = LessonUser.lesson_user(params[:id])
    lesson = Lesson.find(lesson_user.lesson_id)
    lessons = Lesson.where('code = ?', lesson.code)
    lesson_users = lessons.map{|l| LessonUser.find_by('user_id = ? and lesson_id = ?', current_user.id, l.id)}
    lesson_users.each do |lesson_user|
      if lesson_user.user_id == current_user.id
        lesson_user.destroy
      end
    end
    redirect_to "/"
  end

  def all_destroy
    lesson_users = LessonUser.where('user_id = ? ',current_user.id)
    lesson_users.each do |lesson_user|
      if lesson_user.user_id == current_user.id
        lesson_user.destroy
      end
    end
    redirect_to "/"
  end
end
