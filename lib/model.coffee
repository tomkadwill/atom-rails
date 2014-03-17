fs = require 'fs'
Path = require 'path'

module.exports =
class Model
	constructor: (@currentFile) ->
	
	path: ->
		if @currentFile.match /_controller\.rb$/
			@getModel @currentFile
			
	getModel: (currentFile) ->
		"/Users/tomkadwill/.atom/packages/atom-rails/README.md"
