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
    unless user_signed_in? && current_user.admin
      flash[:alert] = "You don't have authorization to view this page."
      redirect_to root_url
    end
  end

  def time_diff(time1, time2)
    t = time1 - time2
    result = ""
    if t < 0
      result << "- "
      t = t.abs
    end
    mm, ss = t.divmod(60)            #=> [4515, 21]
    hh, mm = mm.divmod(60)           #=> [75, 15]
    dd, hh = hh.divmod(24)           #=> [3, 3]
    if (dd != 0) then result << "#{dd} days" end
    if (hh != 0) then result << " #{hh} hours" end
    if (mm != 0) then result << " #{mm} minutes" end
    return result
  end
end
