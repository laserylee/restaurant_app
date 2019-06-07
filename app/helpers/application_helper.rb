module ApplicationHelper
  def activeProvide(path)
    if current_page?(path)
      "active"
    else
      ""
    end
  end
end
