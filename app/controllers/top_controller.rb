class TopController < ApplicationController

  def index
    if user_signed_in?
      @lessons = current_user.lessons
    else
      # redirect_to "new_user_session"
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

     # @lessons = Lesson.where("department_id = ? and wday = ? and period = ? "), current_user.department_id, params[:wday], params[:period]).where.not
    @user_status = LessonUser.new
  end

  def create
    # binding.pry
    lesson = LessonUser.create(lesson_id: lessonUser_create[:lesson_id], user_id: current_user.id)


    # if a = params.require(:lesson_user).permit(:lesson_id)
    #   # params.requireもし、createしたlessson.codeと同じ授業をwhereとかで持ってくる
    #   LessonUser.create(lesson_id: lessonUser_create[ここを考える], user_id: current_user.id)
    # end
    redirect_to "/"
  end

  private
  def lessonUser_create
    params.require(:lesson_user).permit(:lesson_id)
  end
end
