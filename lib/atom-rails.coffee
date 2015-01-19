File = require './file'
GoTo = require './go-to'
Model = require './model'
Related = require './related'

module.exports =
  atomRailsView: null

  activate: (state) ->
    atom.workspaceView.command "atom-rails:go-to", => @goTo()
    atom.workspaceView.command "atom-rails:switch-to-model", => @switchToModel()
    atom.workspaceView.command "atom-rails:related", => @related()

  goTo: ->
    selection = atom.workspaceView.getActiveView().editor.getSelectedText()
    currentFile = @currentFile()
    filePath = new GoTo().path(selection)
    @openFile(filePath)

  switchToModel: ->
    currentFile = @currentFile()
    filePath = new Model(currentFile).path()
    @openFile(filePath)

  related: ->
    currentFile = @currentFile()
    filePath = new Related(currentFile).path()
    @openFile(filePath)

  currentFile: ->
    atom.workspace.getActiveEditor().getPath()

  openFile: (filePath) ->
    new File().openFile(filePath)
