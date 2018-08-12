# == Schema Information
#
# Table name: lessons
#
#  id                :integer          not null, primary key
#  name              :string(255)
#  textbook          :text(65535)
#  referencebook     :text(65535)
#  period            :integer
#  wday              :string(255)
#  unit              :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  department_id     :integer
#  gread_id          :integer
#  teacher_id        :integer
#  term_id           :integer
#  year_id           :integer
#  code              :integer
#  target            :text(65535)
#  contents          :text(65535)
#  level             :text(65535)
#  evaluation        :text(65535)
#  plan              :text(65535)
#  classification_id :integer
#

class Lesson < ActiveRecord::Base
  # enum wday:{monday:"0",tuesday:"1",wednesday:"2",thursday:"3",friday:"4",saturday:"5"}

  belongs_to :department
  belongs_to :gread
  belongs_to :teacher
  belongs_to :term
  belongs_to :year
  belongs_to :classification

  has_many :users, through: :lesson_users
  has_many :lesson_users
  has_many :books


  validates :name, presence: true

end
