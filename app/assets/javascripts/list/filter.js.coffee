# The list that is active on the current page.
activeList = null

# List of currently active filters.
#   Key = filter attribute
#   Value = array of values that will pass the filter
activeFilters = {}
attributeNames = []

document.registerListForFiltering = (list, attribute, possibleValues) ->
  activeFilters[attribute] = possibleValues
  activeList = list
  attributeNames.push(attribute)

document.filterList = (attributeName, values) ->
  values ||= []
  activeFilters[attributeName] = values

  activeList.filter (item) ->
    for attribute, activeValues of activeFilters
      valuesForElement = jQuery(item.elm).data("#{attribute}-list")

      if activeValues.intersection(valuesForElement).length == 0
        return false

    return true
