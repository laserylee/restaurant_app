class ItemsController < ApplicationController
  include ApplicationHelper
  before_action :admin_user

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "New Item: #{@item.name} is created"
      redirect_to itemsbyid_path
    else
      render 'new'
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update_attributes(item_params)
      flash[:notice] = "Item: #{@item.name} is updated"
      redirect_to itemsbyid_path
    else
      render'edit'
    end
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      flash[:notice] = "Item: #{@item.name} is deleted"
      redirect_to itemsbyid_path
    else
      flash[:alert] = "Failed to delete the item"
      redirect_to itemsbyid_path
    end
    
  end

  def byid
  end

  def bycat
  end

  private

    def admin_user
      redirectNonAdmin
    end

    def item_params
      params.require(:item).permit(:name, :description, :category, :picture, :price)
    end

end
