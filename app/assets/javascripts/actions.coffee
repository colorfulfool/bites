class ExperimentForm
  constructor: (@container) ->
    attachChildHandlers()

  attachChildHandlers: ->
    @container.on 'type', '.child input[name=assumption]', ->
      updateParentsReferenceTo nameOfExperiment(this), idOfExperiment(this)

    @container.on 'ajax:success', '.child form', ->
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