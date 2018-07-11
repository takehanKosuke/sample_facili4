class TopController < ApplicationController

  def index
    @q = Lesson.ransack(params[:q])
    @lessons = @q.result(distinct: true)

    if user_signed_in?
      @lessons = current_user.lessons
    else
      # redirect_to 'new_user_session_path'
    end
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

  def new
    @lessons =
      Lesson.where(
        "department_id = ? AND
        wday = ? AND
        period = ? AND
        gread_id <= ? AND
        term_id in (?) AND
        gread_id <= ?",
        current_user.department_id,
        params[:wday],
        params[:period],
        params[:gread_id],
        params[:term_id],
        params[:gread_id]
      )
    @user_status = LessonUser.new
  end

  def create
    lessonUser_create['lesson_ids'].split(' ').each do |t|
      lesson = LessonUser.new
      lesson.lesson_id = t
      lesson.user_id = current_user.id
      lesson.save
    end

    redirect_to "/"
  end

  def search
    @q = Lesson.search(search_params)
    @lessons = @q.result(distinct: true)
    @user_status = LessonUser.new
  end

  private
  def search_params
    params.require(:q).permit(:name_cont)
  end

  def lessonUser_create
    params.require(:lesson_user).permit(:lesson_ids)
  end
end
