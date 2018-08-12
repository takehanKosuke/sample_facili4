# == Schema Information
#
# Table name: greads
#
#  id         :integer          not null, primary key
#  gread      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Gread < ActiveRecord::Base
   has_many :lessons
   has_many :users
end
