class UsersController < ApplicationController
  include ApplicationHelper
  before_action :redirectNonAdmin, only: :index

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end


end
