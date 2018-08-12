# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  department_id          :integer
#  permission             :integer
#  name                   :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  gread_id               :integer
#

class User < ActiveRecord::Base
  enum permission:{normal:0,administrator:1}
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :department
  belongs_to :gread

  has_many :lesson_users
  has_many :lessons, through: :lesson_users
  has_many :user_books


  def self.ture_user_lessons(current_user)
    ture_user_lessons = []
    current_user.lessons.each do |lesson|
      ture_user_lessons << lesson unless ture_user_lessons.map{|e|e.code}.include?(lesson.code)
    end
    return ture_user_lessons
  end
end
