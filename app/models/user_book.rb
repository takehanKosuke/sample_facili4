# == Schema Information
#
# Table name: user_books
#
#  id         :integer          not null, primary key
#  book_id    :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UserBook < ActiveRecord::Base
  belongs_to :user
  belongs_to :book
end
