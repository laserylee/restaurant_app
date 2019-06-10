class ItemsController < ApplicationController
  include ApplicationHelper
  before_action :admin_user

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def byid
  end

  def bycat
  end

  private

    def admin_user
      redirectNonAdmin
    end

end
