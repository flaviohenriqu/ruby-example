module ApplicationHelper
  def titulo(page_title = '')
    base_title = "Proficiency Test"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
end
