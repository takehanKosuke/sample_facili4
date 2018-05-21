class TopController < ApplicationController
  def index
  end

  def new
    @lessons = Lesson.where("department_id = ? and wday = ? and piriod = ? and term_id = ? or term_id = ?", current_user.department_id, params[:wday], params[:piriod], params[:term_id], 3)

     # @lessons = Lesson.where("department_id = ? and wday = ? and piriod = ? "), current_user.department_id, params[:wday], params[:piriod]).where.not
    @user_status = LessonUser.new
  end

  def create
    LessonUser.create(lessonUser_create)
    redirect_to "/"
  end

  private
  def lessonUser_create
    params.require(:lesson_user).permit(:lesson_id, :user_id)
  end
end
