class CartsController < ApplicationController
  before_action :only_pending_orders

  def show
    @order_items = current_order.order_items
  end

  def only_pending_orders
    unless current_order.order_status_id == 1 || current_order.order_items.count == 0
      flash[:notice] = "Please view this order inside your order history"
      redirect_to root_path
    end
  end
end
