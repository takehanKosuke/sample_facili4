class Gread < ActiveRecord::Base
   has_many :lessons
   has_many :users
end
