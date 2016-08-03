module CategoriesHelper
  def category_dropdown(builder)
    attribute_name = :category_ids
    id = "#{builder.object_name}_#{attribute_name}"

    builder.collection_select(
      attribute_name,
      Category.all,
      :id,
      :title,
      { }, {
        multiple: true,
        data: { "multi-select" => 'dropdown' }
      }
    )
  end

  def active_category_dropdown
    attribute_name = :category_ids

    categories = Category.all

    content_tag :div do
      select(:active_categories, nil, [], {}, id: attribute_name, multiple: true, data: { "multi-select" => 'dropdown', "attribute" => "category", "behavior" => "filter-select-box" }) do
        options_from_collection_for_select(Category.all, :title, :title, proc { true })
      end
    end
  end
end
