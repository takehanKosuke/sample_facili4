# == Schema Information
#
# Table name: books
#
#  id                  :integer          not null, primary key
#  name_text           :text(65535)
#  author              :text(65535)
#  list_price          :integer
#  ctext_lassification :integer
#  lesson_id           :integer
#  user_id             :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
