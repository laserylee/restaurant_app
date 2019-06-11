class StaticPagesController < ApplicationController
include ApplicationHelper

  def home
    @items = Item.all
    @order_item = current_order.order_items.new
  end

  def about
  end

  def help
  end

  def contact
  end

  def adminpanel
    redirectNonAdmin
  end

end
