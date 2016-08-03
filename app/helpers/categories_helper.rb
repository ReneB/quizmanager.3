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
      select(:active_categories, nil, [], {}, id: attribute_name, multiple: true, data: { "multi-select" => 'dropdown', "attribute" => "category" }) do
        options_from_collection_for_select(Category.all, :title, :title, proc { true })
      end +

      javascript_tag(<<-JAVASCRIPT.html_safe)
        jQuery(document).on('change', '##{attribute_name}', function(event) {
          var selectBox = jQuery(event.target);

          document.filterList(selectBox.data('attribute'), selectBox.val());
        });
      JAVASCRIPT
    end
  end
end
