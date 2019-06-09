module ApplicationHelper
  def activeProvide(path)
    if current_page?(path)
      "active"
    else
      ""
    end
  end

  def allCategory(item)
    @array = []
    item.all.each do |f|
      if !@array.include?(f.category)
        @array << f.category
      end
    end
    return @array
  end

  def redirectNonAdmin
    unless user_signed_in? && !current_user.admin.nil?
      byebug
      flash[:alert] = "You don't have authorization to view this page."
      redirect_to root_url
    end
  end
end
