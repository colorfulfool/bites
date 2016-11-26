class ExperimentForm
  constructor: (@container) ->
    attachParentHandlers()
    attachChildHandlers()

  attachParentHandlers: ->
    @container.on 'change', '.parent input[name=action]', ->
      proposeChildrenWithNames declarationsIn $(this).val()

  attachChildHandlers: ->
    @container.on 'change', '.children input[name=assumption]', ->
      originalName = $(this).find('input[name=original_name]').val()
      updateParentsReferenceTo originalName, idOfExperiment(this)

    @container.on 'ajax:success', '.children form', ->
      updateParentsReferenceTo nameOfExperiment(this), idOfExperiment(this)

  updateParentsReferenceTo: (name, id = null) ->
    if name?
      text = @parentAction.val()
      updatedText = text.replace anyReferenceTo(name), referenceWithId(name, id)
      @parentAction.val(updatedText)

  nameOfExperiment: (experimentContainer) ->
    firstDeclarationIn experimentContainer.find('input[name=assumption]').val()

  idOfExperiment: (experimentContainer) ->
    experimentContainer.find('form').attr('url').find /\/\d+\/$/