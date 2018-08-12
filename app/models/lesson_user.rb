# == Schema Information
#
# Table name: lesson_users
#
#  id         :integer          not null, primary key
#  lesson_id  :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class LessonUser < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :user

  scope :lesson_user, ->(id){LessonUser.find(id)}
end
