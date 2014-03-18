fs = require 'fs'
Path = require 'path'

module.exports =
class Model
	constructor: (@currentFile) ->
	
	path: ->
		if @currentFile.match /_controller\.rb$/
			@getModelPath @currentFile
			
	getModelPath: (currentFile) ->
		path = currentFile.replace /s_controller\.rb$/, '.rb'
		path = path.replace 'controllers', 'models'
