class TopController < ApplicationController
  def index
  end

  def search
    @lessons = Lesson.where("department_id = ? and wday = ? and piriod = ?", current_user.department_id, params[:wday], params[:piriod])
  end
end
