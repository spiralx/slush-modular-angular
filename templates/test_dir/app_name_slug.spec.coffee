
expect = require('chai').expect
sinon = require 'sinon'

<%= app_name_camel %> = require '../<%= source_dir %>/<%= app_name_slug %>'


# -----------------------------------------------------------------------------

describe '<%= app_name_slug %>.coffee', ->
  sandbox = null

  beforeEach ->
    sandbox = sinon.sandbox.create()
    sandbox.stub console, 'log'
    return

  afterEach ->
    sandbox.restore()


  describe 'getAppName()', ->

    it 'should say return the correct name', (done) ->
      expect <%= app_name_camel %>.getAppName()
        .to.be.a 'string'
        .and.to.equal '<%= app_name %>'
      done()


  describe 'hello()', ->

    it 'should say hello', (done) ->
      <%= app_name_camel %>.hello()

      sinon.assert.calledOnce console.log
      sinon.assert.calledWithExactly console.log, 'Hello from <%= app_name %>!'
      done()
