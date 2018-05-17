class Faculty < ActiveRecord::Base
  has_many :users
  has_many :lessons
  has_many :departments
end
