fs = require 'fs'
Path = require 'path'

module.exports =
class GoTo
  constructor: ->

  path: (@selection) ->
    return false if !@selection
    partialPath = @match()
    path = 'app/views/layouts/_' + partialPath + '.html.erb'
    Path.join atom.project.getPath(), path

  match: ->
    regex = /\/[^']*/i # match everything after '\'
                       # not including a ,
    match = @selection.match(regex)[0]
    match.replace('\/', '')
