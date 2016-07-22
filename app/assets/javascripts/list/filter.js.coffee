activeList = null
activeValues = []
attributeName = ""

document.registerListForFiltering = (list, attribute, possibleValues) ->
  activeValues = possibleValues
  activeList = list
  attributeName = attribute

$(document).on 'click', '[data-behavior=filter-list]', (event) ->
  event.preventDefault()

  $(event.target).toggleClass('btn-success')
  selectedValue = $(event.target).data(attributeName)

  if (selectedValue in activeValues)
    activeValues = activeValues.filter (value) -> value isnt selectedValue
  else
    activeValues.push selectedValue

  activeList.filter (item) ->
    for value in $(item.elm).data("#{attributeName}-list")
      return true if value in activeValues

    return false
