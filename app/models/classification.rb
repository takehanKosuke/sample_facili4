# == Schema Information
#
# Table name: classifications
#
#  id         :integer          not null, primary key
#  word       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Classification < ActiveRecord::Base
  has_many :lessons
end
