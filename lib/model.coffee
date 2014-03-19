fs = require 'fs'
Path = require 'path'

module.exports =
class Model
	constructor: (@currentFile) ->
	
	path: ->
		if @currentFile.match /_controller\.rb$/
			@getModelPath @currentFile
			
	getModelPath: (currentFile) ->
		currentFile = currentFile.replace /s_controller\.rb$/, '.rb'
		path = currentFile.replace 'controllers', 'models'
		if fs.existsSync path
			return path
		else
			file = currentFile.replace(/^.*[\\\/]/, '')
			start = currentFile.indexOf("controllers")
			end = currentFile.indexOf(file)
			pathToReplace = currentFile.substr(start, end)
			path = currentFile.replace pathToReplace, 'models/' + file
			return path if fs.existsSync path
