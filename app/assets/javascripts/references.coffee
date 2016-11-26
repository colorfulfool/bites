@anyReferenceTo = (name) ->
  /\[#{name}\[:\d]+?]/

@referenceWithId = (name, id) ->
  if id?
    "[#{name}:#{id}]"
  else
    "[#{name}]"

@declarationsIn = (text) ->
  text.match(/\[([\S ]+)\]/g)

@firstDeclarationIn = (text) ->
  declarationsIn(text)[0]