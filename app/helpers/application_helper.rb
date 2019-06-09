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

end
