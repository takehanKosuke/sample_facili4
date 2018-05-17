class LessonsController < ApplicationController
  def new
    if current_user.permission != "administrator"
      redirect_to "/"
    end
    @lesson = Lesson.new
  end

  def create
    Lesson.create(lesson_create)
    redirect_to "/"
  end



  private
  def lesson_create
    params.require(:lesson).permit(:name, :room_number, :textbook, :referencebook, :piriod, :wday, :unit, :faculty_id, :department_id, :gread_id, :teacher_id, :term_id, :year_id)
  end
end
