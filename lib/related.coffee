fs = require 'fs'
Path = require 'path'

module.exports =
class Related
  constructor: (@currentFile) ->

  path: ->
    switch
      when @currentFile.match /models\//
        path = Path.join atom.project.getPath(), 'db/schema.rb'
        return path if fs.existsSync path
      when @currentFile.match /controllers\//
        path = @currentFile.replace /controller/g, 'helper'
        return path if fs.existsSync path
      when @currentFile.match /views\//
        file = @currentFile.replace(/^.*[\\\/]/, '')
        path = @currentFile.replace /views/g, 'controllers'
        path = path.replace ('/' + file), '_controller.rb'
        return path if fs.existsSync path
