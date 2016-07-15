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
end
