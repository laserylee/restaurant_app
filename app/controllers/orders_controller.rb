class OrdersController < ApplicationController
  include ApplicationHelper

  before_action :redirectSignIn,   only: [:edit, :update, :destroy, :show]
  before_action :redirectNonAdmin, only: [:index, :done]

  def index
    updateAbandonedStatus
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
    if !@order.pickup_time.nil? && @order.pickup_time > (Time.zone.now - 15.minutes)
      flash[:alert] = "You cannot change the pickup time 15 minutes prior to the agreed pickup time"
      render user_path(@order.user_id)
    end
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

  def done
    @order = Order.find(params[:id])
    @order.order_status_id = 3
    @order.save
    render 'index'
  end


  def destroy
    @order = Order.find(params[:id])
    if User.find(@order.user_id).admin
      @order.order_status_id = 4
      @order.save
      render 'index'
    else
      if @order.pickup_time >= Time.zone.now - 15.minutes
        if @order.pickup_time <= Time.zone.now + 15.minutes
          flash[:alert] = "You are too late to cancel this order, please get your order from the restaurant."
          render user_path(@order.user_id)
        else
          flash[:alert] = "You have abandoned this order."
          render user_path(@order.user_id)
        end
      else
        @order.order_status_id = 4
        @order.save
        render user_path(@order.user_id)
      end
    end
  end

private

  def redirectSignIn
    unless user_signed_in?
      flash[:notice] = "Please sign in first."
      redirect_to new_user_session_path
    end
  end

  def updateAbandonedStatus
    @orderO = Order.all.where(order_status_id: 2)
    @orderO.all.each do |f|
      if f.pickup_time < Time.zone.now - 15.minutes
        f.order_status_id = 5
        f.save
      end
    end
  end

end
