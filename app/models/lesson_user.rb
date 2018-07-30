class LessonUser < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :user

  scope :lesson_user, ->(id){LessonUser.find(id)}
end
