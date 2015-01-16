Model = require './model'
File = require './file'
Related = require './related'

module.exports =
  atomRailsView: null

  activate: (state) ->
    atom.workspaceView.command "atom-rails:switch-to-model", => @switchToModel()
    atom.workspaceView.command "atom-rails:related", => @related()

  switchToModel: ->
    currentFile = atom.workspace.getActiveEditor().getPath()
    filePath = new Model(currentFile).path()
    new File().openFile(filePath)

  related: ->
    currentFile = atom.workspace.getActiveEditor().getPath()
    filePath = new Related(currentFile).path()
    new File().openFile(filePath)
