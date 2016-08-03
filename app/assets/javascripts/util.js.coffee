intersection = (a, b) ->
  [a, b] = [b, a] if a.length > b.length
  value for value in a when value in b

Array.prototype.intersection = (other) ->
  intersection(@, other)
