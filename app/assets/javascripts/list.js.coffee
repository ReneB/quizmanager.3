#= require list/list.min
#= require list/filter

document.addEventListener 'turbolinks:load', ->
  lists = jQuery('[data-behavior=list]')
  return if lists.length == 0

  lists.each (index, element) ->
    list = jQuery(element)
   
    valueNames = list.data('value-names')
    id = list.attr('id')

    interactiveList = new List(id, valueNames: valueNames)

    for key, values of list.data('filters')
      document.registerListForFiltering(interactiveList, key, values)
