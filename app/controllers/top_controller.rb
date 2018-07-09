class TopController < ApplicationController

  def index
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
    # binding.pry
    # lesson = LessonUser.create(lesson_id: lessonUser_create[:lesson_id], user_id: current_user.id)

    lessonUser_create['lesson_ids'].split(' ').each do |t|
      lesson = LessonUser.new
      lesson.lesson_id = t
      lesson.user_id = current_user.id
      lesson.save
    end
# def create
#   product = Product.new
#   product_params['type'].each do |t|
#     product.name = product_params['name']
#     product.about = product_params['about']
#     product.type = t
#     product.save
#   end
# end


    # Lesson.where('code = ?', lesson.code).each do |l|
    #   lesson = LessonUser.new
    #   lesson.lesson_id = l
    #   lesson.user_id = current_user.id
    #   lesson.save
    # end
    redirect_to "/"
  end

  private
  def lessonUser_create
    params.require(:lesson_user).permit(:lesson_ids)
  end
end
