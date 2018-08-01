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
