Model = require './model'

module.exports =
  atomRailsView: null

  activate: (state) ->
    atom.workspaceView.command "atom-rails:switch-to-model", => @switchToModel()

  switchToModel: ->
    currentFile = atom.workspace.getActiveEditor().getPath()
    file = new Model(currentFile).path()
    atom.workspaceView.open(file) if file?
