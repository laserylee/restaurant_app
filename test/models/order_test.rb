require 'test_helper'

class OrderTest < ActiveSupport::TestCase

  def setup
    @user = users(:tete)
    @user.save
    @o001 = orders(:o001)
    @o001.user_id = @user.id
    @o001.pickup_time = Time.zone.now + 2.hours
  end

  test "should be valid" do
    assert @o001.valid?
  end

  test "item quantity" do
    @o001.item_quantity = "3"
    assert @o001.valid?
    @o001.item_quantity = "34435"
    assert @o001.valid?
    @o001.item_quantity = "334 3434 34 3443 34"
    assert @o001.valid?
    @o001.item_quantity = "3 "
    assert @o001.valid?
    @o001.item_quantity = "3 333 34 "
    assert @o001.valid?
    @o001.item_quantity = "3erg"
    assert_not @o001.valid?
  end

  test "pickup time" do
    @o001.pickup_time = Time.zone.now + 1.hours
    assert_not @o001.valid?
    @o001.pickup_time = Time.zone.now + 59.minutes
    assert_not @o001.valid?
    @o001.pickup_time = Time.zone.now
    assert_not @o001.valid?
    @o001.pickup_time = Time.zone.now + 61.minutes
    assert @o001.valid?
  end


end
