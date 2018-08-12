# == Schema Information
#
# Table name: terms
#
#  id         :integer          not null, primary key
#  term       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Term < ActiveRecord::Base
  has_many :lessons
end
