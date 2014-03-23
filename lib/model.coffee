fs = require 'fs'
Path = require 'path'

module.exports =
class Model
  constructor: (@currentFile) ->

  path: ->
    if @currentFile.match /_controller\.rb$/
      @getModelForController @currentFile
    else if @currentFile.match /views\//
      @getModelForView @currentFile

  getModelForController: (currentFile) ->
    if currentFile.indexOf("s_controller") != -1
      currentFile = currentFile.replace /s_controller\.rb$/, '.rb'

      path = @replaceControllerPath currentFile, /s_controller\.rb$/
      if fs.existsSync path
        return path
      else
        file = currentFile.replace(/^.*[\\\/]/, '')
        start = currentFile.indexOf("controllers")
        end = currentFile.indexOf(file)
        pathToReplace = currentFile.substr(start, end)
        path = currentFile.replace pathToReplace, 'models/' + file
        return path if fs.existsSync path
    else
      path = @replaceControllerPath currentFile, /_controller\.rb$/
      return path if fs.existsSync path

  getModelForView: (currentFile) ->
    file = currentFile.replace /^.*[\\\/]/, ''
    path = currentFile.replace /views\//, 'models/'
    path = path.replace '/' + file, '.rb'
    path = @singularise path
    return path if fs.existsSync path

  singularise: (pluralPath) ->
    pluralPath.replace /s\.rb$/, '.rb'

  replaceControllerPath: (currentFile, matcher) ->
    currentFile = currentFile.replace matcher, '.rb'
    currentFile.replace 'controllers', 'models'
