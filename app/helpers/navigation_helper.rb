module NavigationHelper
  def navbar_item(text, href, controller)
    content_tag :li, class: controller_name == controller ? 'active' : '' do
      link_to(text, href)
    end
  end
end
