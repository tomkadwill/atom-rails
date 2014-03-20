fs = require 'fs'
Path = require 'path'

module.exports =
class Related
	constructor: (@currentFile) ->
	
	path: ->
		if @currentFile.match /models\//
		  return Path.join atom.project.getPath(), 'db/schema.rb'
