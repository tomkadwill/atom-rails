Model = require './model'
Related = require './related'

module.exports =
  atomRailsView: null

  activate: (state) ->
    atom.workspaceView.command "atom-rails:switch-to-model", => @switchToModel()
    atom.workspaceView.command "atom-rails:related", => @related()

  switchToModel: ->
    currentFile = atom.workspace.getActiveEditor().getPath()
    file = new Model(currentFile).path()
    atom.workspaceView.open(file) if file?
    
  related: ->
    currentFile = atom.workspace.getActiveEditor().getPath()
    file = new Related(currentFile).path()
    atom.workspaceView.open(file) if file?
