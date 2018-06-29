class LessonUser < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :user

  after_create :save_paired_lesson_if_same_lesson_id_exists?

  def save_paired_lesson_if_same_lesson_id_exists?
    #
  end
end
