class User < ActiveRecord::Base
  enum permission:{normal:0,administrator:1}
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :faculty
  belongs_to :department
  belongs_to :gread

  has_many :lesson_users
  has_many :lessons, through: :lesson_users
end
