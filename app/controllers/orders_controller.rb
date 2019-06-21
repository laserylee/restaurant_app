class OrdersController < ApplicationController
  include ApplicationHelper

  before_action :redirectSignIn,   only: [:edit, :update, :destroy, :show]
  before_action :redirectNonAdmin, only: [:index, :done]

  def index
    updateAbandonedStatus
  end

  def show
    @order = Order.find(params[:id])
    redirectIncorrectUser
    if (@order.pickup_time >= (Time.zone.now - 15.minutes)) && (@order.pickup_time <= (Time.zone.now + 15.minutes)) && (@order.order_status_id == 2)
      flash[:notice] =  "Your order is getting readied by our staff now. Please be punctual to get your order."
    end
  end

  def edit
    @order = Order.find(params[:id])
    unless @order.order_status_id == 1
      redirectIncorrectUser
      if @order.order_status_id != 2
        flash[:alert] = "Sorry that the pickup time of your order is no longer editable."
        redirect_to order_path(@order)
        return
      elsif !@order.pickup_time.nil? && Time.zone.now > (@order.pickup_time - 15.minutes)
        flash[:alert] = "You cannot change the pickup time after 15 minutes prior to the agreed pickup time."
        redirect_to order_path(@order)
        return
      end
    end
  end

  def update
    @order = Order.find(params[:id])
    redirectIncorrectUser
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
    redirectIncorrectUser
    if current_user.admin
      @order.order_status_id = 4
      @order.save
      render 'index'
    else
      if @order.pickup_time <= Time.zone.now + 15.minutes
        if @order.pickup_time >= Time.zone.now - 15.minutes
          flash[:alert] = "You are too late to cancel this order, please get your order from the restaurant."
          redirect_to user_path(@order.user_id)
        else
          flash[:alert] = "You have abandoned this order."
          redirect_to user_path(@order.user_id)
        end
      else
        @order.order_status_id = 4
        @order.save
        redirect_to user_path(@order.user_id)
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

  def redirectIncorrectUser
    unless current_user.id == @order.user_id || current_user.admin
      flash[:alert] = "You dont have permission to view this page"
      redirect_to root_url
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
