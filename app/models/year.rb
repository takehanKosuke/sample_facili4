# == Schema Information
#
# Table name: years
#
#  id         :integer          not null, primary key
#  year       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Year < ActiveRecord::Base
  has_many :lessons
end
