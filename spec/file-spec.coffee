File = require '../lib/file'
{WorkspaceView} = require 'atom'

describe 'File', ->
  describe 'openFile', ->
    file = new File()

    it 'opens file when file exists', ->
      # This is a bit of a hack
      atom.workspaceView = new WorkspaceView
      spyOn(atom.workspaceView, 'open').andReturn 'opened'
      expect(file.openFile(true)).toEqual 'opened'

    it 'beeps when file does not exist', ->
      # This is a bit of a hack
      spyOn(atom, 'beep').andReturn 'beep'
      expect(file.openFile()).toEqual 'beep'
