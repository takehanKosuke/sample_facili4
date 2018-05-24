class Teacher < ActiveRecord::Base
  has_many :lessons

  has_many :lessons, through: :lesson_teachers
  has_many :lesson_teachers
end
