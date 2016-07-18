module SortingHelper
  # supported types: 'alphabet', 'order', 'attributes'
  def sorting_icons(type)
    glyph("sort") +
    glyph("sort-by-#{type}") +
    glyph("sort-by-#{type}-alt")
  end
end
