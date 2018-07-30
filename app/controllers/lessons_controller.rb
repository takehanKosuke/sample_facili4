class LessonsController < ApplicationController
  def new
    if current_user.permission != "administrator"
      redirect_to "/"
    end
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.lesson_create.new
    if @lesson.save
      redirect_to :root #成功の場合
    else
      render 'new' #失敗の場合
    end
    Lesson.create(lesson_create)
    redirect_to "/"
  end

  def show
    @lesson = Lesson.find(params[:id])
    @lesson_user = LessonUser.where("lesson_id = ? and user_id = ?", @lesson.id, current_user.id).first
  end



  private
  def lesson_create
    params.require(:lesson).permit(:name, :room_number, :textbook, :referencebook, :period, :wday, :unit, :faculty_id, :department_id, :gread_id, :teacher_id, :term_id, :year_id)
  end
end
