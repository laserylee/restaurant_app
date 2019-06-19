# == Schema Information
#
# Table name: orders
#
#  id              :integer          not null, primary key
#  subtotal        :decimal(12, 3)
#  tax             :decimal(12, 3)
#  total           :decimal(12, 3)
#  order_status_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :integer
#  order_code      :string
#  pickup_time     :datetime
#

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
