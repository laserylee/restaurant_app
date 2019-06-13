class OrdersController < ApplicationController
  include ApplicationHelper

  before_action :redirectSignIn,   only: [:edit, :update, :destroy, :show]
  before_action :redirectNonAdmin, only: [:index]

  def index
  end

  def show
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    y = params[:order]["pickup_time(1i)"]
    mo = params[:order]["pickup_time(2i)"]
    d = params[:order]["pickup_time(3i)"]
    h = params[:order]["pickup_time(4i)"]
    mi = params[:order]["pickup_time(5i)"]
    @pickup_time = Time.new(y,mo,d,h,mi)
    if @pickup_time > (Time.now + 1.hours)
      @order.pickup_time = @pickup_time
      @order.order_status_id = 2
      @order.save!
    end 
    byebug
  end

  def destroy
  end

  def redirectSignIn
    unless user_signed_in?
      flash[:notice] = "Please sign in first."
      redirect_to new_user_session_path
    end
  end
end
