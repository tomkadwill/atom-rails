module.exports =
class File

  openFile: (file) ->
    if file?
      atom.workspaceView.open(file)
    else
      atom.beep()
