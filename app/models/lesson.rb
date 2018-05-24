class Lesson < ActiveRecord::Base
  enum wday:{monday:"0",tuesday:"1",wednesday:"2",thursday:"3",friday:"4",saturday:"5"}

  belongs_to :department
  belongs_to :faculty
  belongs_to :gread
  belongs_to :teacher
  belongs_to :term
  belongs_to :year

  has_many :users, through: :lesson_users
  has_many :lesson_users

  has_many :lesson_teachers
  has_many :teachers, through: :lesson_teachers
end
