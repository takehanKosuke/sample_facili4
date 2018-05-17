class Department < ActiveRecord::Base
  has_many :users
  has_many :lessons

  belongs_to :faculty
end
