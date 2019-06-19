# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  category    :string
#  picture     :string
#  price       :decimal(12, 3)
#  active      :boolean
#

require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
