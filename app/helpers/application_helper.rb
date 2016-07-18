module ApplicationHelper
  def container(&content)
    content_tag :div, class: 'container', &content
  end
end
