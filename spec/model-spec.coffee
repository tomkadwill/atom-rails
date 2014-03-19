Path = require 'path'
Model = require '../lib/model'

describe 'Model', ->
  rootPath = Path.join __dirname, 'fixtures'

  describe 'path', ->
    usersController = Path.join rootPath, 'app/controllers/users_controller.rb'
    userModel = Path.join rootPath, 'app/models/user.rb'
    model = new Model(usersController)
			
    it 'returns model for controller', ->
	    expect(model.path(usersController)).toBe userModel
			
    it 'returns model when controller is in different directory path', ->
		  # pending	

		it 'does not return model file if model file does not exist', ->
			sessionsController = Path.join rootPath, 'app/controllers/sessions_controller.rb'
			model = new Model(sessionsController)
			expect(model.path(sessionsController)).toBeUndefined()
