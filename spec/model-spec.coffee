Path = require 'path'
Model = require '../lib/model'

describe 'Model', ->
  rootPath = Path.join __dirname, 'fixtures'

  describe 'path', ->
    usersController = Path.join rootPath, 'app/controllers/users_controller.rb'
    usersView = Path.join rootPath, 'app/views/users/index.html.erb'
    userModel = Path.join rootPath, 'app/models/user.rb'
    model = new Model(usersController)

    ## controllers
    it 'returns model for controller', ->
      expect(model.path(usersController)).toBe userModel

    it 'returns model when controller is in different directory path', ->
      adminUsersController = Path.join rootPath, 'app/controllers/admin/users_controller.rb'
      expect(model.path(adminUsersController)).toBe userModel
      
    it 'returns model when controller does not end is an "s"', ->
      adminUsersController = Path.join rootPath, 'app/controllers/user_controller.rb'
      expect(model.path(adminUsersController)).toBe userModel

    it 'does not return model file if model file does not exist', ->
      sessionsController = Path.join rootPath, 'app/controllers/sessions_controller.rb'
      model = new Model(sessionsController)
      expect(model.path(sessionsController)).toBeUndefined()
      
    ## views  
    it 'returns model for view', ->
      model = new Model(usersView)
      expect(model.path(usersView)).toBe userModel
      
  describe 'singularise', ->
    pluralPath = Path.join rootPath, 'app/models/users.rb'
    singularPath = Path.join rootPath, 'app/models/user.rb'
    usersView = Path.join rootPath, 'app/views/users/index.html.erb'
    model = new Model(usersView)
    
    it 'converts plural file name to singular', ->
      expect(model.singularise(pluralPath)).toBe singularPath

  describe 'replaceControllerPath', ->
    usersController = Path.join rootPath, 'app/controllers/users_controller.rb'
    model = new Model(usersController)
    userModel = Path.join rootPath, 'app/models/user.rb'
    
    it 'replaces "s_controller" with ".rb"', ->
      expect(model.replaceControllerPath(usersController, /s_controller\.rb$/)).toBe userModel
      
    it 'replaces "_controller" with ".rb"', ->
      userController = Path.join rootPath, 'app/controllers/user_controller.rb'
      expect(model.replaceControllerPath(userController, /_controller\.rb$/)).toBe userModel
