class Book < ActiveRecord::Base
  belongs_to :lessons
  has_many :user_books
end
