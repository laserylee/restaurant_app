class StaticPagesController < ApplicationController
include ApplicationHelper

  def home
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
