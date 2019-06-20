class OrdersController < ApplicationController
  include ApplicationHelper

  before_action :redirectSignIn,   only: [:edit, :update, :destroy, :show]
  before_action :redirectNonAdmin, only: [:index]

  def index
  end

  def show
    @order = Order.find(params[:id])
    unless @order.user_id == current_user.id || current_user.admin
      flash[:notice] = "This is not your order"
      redirect_to root_url
    end
    if (@order.pickup_time >= (Time.zone.now - 15.minutes)) && (@order.pickup_time <= (Time.zone.now + 15.minutes)) && (@order.order_status_id == 2)
      flash[:alert] = "Your order is getting readied by our staff now. Please be punctual to get your order."
    end
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
    @pickup_time = Time.utc(y,mo,d,h,mi,0).in_time_zone
    if @pickup_time > (Time.zone.now + 1.hours)
      @order.pickup_time = @pickup_time
      @order.order_status_id = 2
      @order.user_id = current_user.id
      @order.order_code = SecureRandom.urlsafe_base64
      @order.save!
      session[:order_id] = nil
      redirect_to order_path(@order)
    else
      flash[:notice] = "Please choose a time which is at least 1 hour later than this order"
      render 'edit'
    end
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
