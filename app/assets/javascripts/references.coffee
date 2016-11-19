@anyReferenceTo = (name) ->
  /\[#{name}\[:\d]+?]/

@referenceWithId = (name, id) ->
  if id?
    "[#{name}:#{id}]"
  else
    "[#{name}]"

@firstDeclarationIn = (text) ->
  text.match(/\[([\S ]+)\]/g)[0]