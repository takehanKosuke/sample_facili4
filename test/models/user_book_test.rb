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

require 'test_helper'

class UserBookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
