Path = require 'path'
GoTo = require '../lib/go-to'

describe 'Related', ->
  rootPath = Path.join __dirname, 'fixtures'

  describe 'path', ->
    usersView = Path.join rootPath, 'app/views/users/index.html.erb'
    navigationPartial = Path.join rootPath, 'app/views/layouts/_navigation.html.erb'
    goTo = new GoTo()

    it 'returns partial', ->
      expect(goTo.path('layouts/navigation')).toBe navigationPartial

    it 'returns partial', ->
      expect(goTo.path("'layouts/navigation'")).toBe navigationPartial

    it 'does not returns partial', ->
      expect(goTo.path()).not.toBe navigationPartial
