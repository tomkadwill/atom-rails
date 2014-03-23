fs = require 'fs'
Path = require 'path'

module.exports =
class Related
  constructor: (@currentFile) ->

  path: ->
    # Why do tests fail when this is 'else if'?
    file = @currentFile.replace(/^.*[\\\/]/, '')
    if @currentFile.match /models\//
      path = Path.join atom.project.getPath(), 'db/schema.rb'
      return path if fs.existsSync path
    if @currentFile.match /controllers\//
      path = @currentFile.replace /controller/g, 'helper'
      return path if fs.existsSync path
    if @currentFile.match /views\//
      path = @currentFile.replace /views/g, 'controllers'
      path = path.replace ('/' + file), '_controller.rb'
      return path if fs.existsSync path
