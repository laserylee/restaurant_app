class OrdersController < ApplicationController
  include ApplicationHelper

  before_action :redirectSignIn,   only: [:edit, :update, :destroy, :show]
  before_action :redirectNonAdmin, only: [:index]

  def index
  end

  def show
  end

  def new
  end

  def create
    @order = current_order
    byebug
    @order.pickup_time = Time.zone.now + params[:pickup_time][:pickup_time].minutes
    if @order.save
      byebug
    else
      byebug
    end
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
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

  def order_params
    params.permit(:pickup_time)
  end
end
