Path = require 'path'
Related = require '../lib/related'

describe 'Related', ->
	rootPath = Path.join __dirname, 'fixtures'

	describe 'path', ->
		userModel = Path.join rootPath, 'app/models/user.rb'
		schema = Path.join rootPath, 'db/schema.rb'
		related = new Related(userModel)
			
		it 'returns schema for a model', ->
			expect(related.path()).toBe schema

		it 'does not return schema for a controller', ->
      userController = Path.join rootPath, 'app/controllers/users_controller.rb'
      related = new Related(userController)
      expect(related.path()).toBeUndefined()

		it 'does not return schema for a view', ->
			userView = Path.join rootPath, 'app/views/users/index.html.erb'
			related = new Related(userView)
			expect(related.path()).toBeUndefined()
