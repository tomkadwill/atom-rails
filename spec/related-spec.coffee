Path = require 'path'
Related = require '../lib/related'

describe 'Related', ->
  rootPath = Path.join __dirname, 'fixtures'

  describe 'path', ->
    userModel = Path.join rootPath, 'app/models/user.rb'
    usersController = Path.join rootPath, 'app/controllers/users_controller.rb'
    usersView = Path.join rootPath, 'app/views/users/index.html.erb'
    usersHelper = Path.join rootPath, 'app/helpers/users_helper.rb'
    schema = Path.join rootPath, 'db/schema.rb'
    related = new Related(userModel)

    ## models
    it 'returns schema for a model', ->
      expect(related.path()).toBe schema

    it 'does not return schema for a controller', ->
      related = new Related(usersController)
      expect(related.path()).not.toBe schema

    it 'does not return schema for a view', ->
      related = new Related(usersView)
      expect(related.path()).not.toBe schema

    ## controllers
    it 'returns associated helper file for a controller', ->
      related = new Related(usersController)
      expect(related.path()).toBe usersHelper

    it 'returns nothing if associated helper file for a controller does not exist', ->
      sessionsController = Path.join rootPath, 'app/controllers/sessions_controller.rb'
      related = new Related(sessionsController)
      expect(related.path()).toBeUndefined()

    it 'does not return associated helper for model', ->
      related = new Related(userModel)
      expect(related.path()).not.toBe usersHelper

    it 'does not return schema for view', ->
      related = new Related(usersView)
      expect(related.path()).not.toBe usersHelper

    ## views
    it 'returns associated controller file for a view', ->
      related = new Related(usersView)
      expect(related.path()).toBe usersController
