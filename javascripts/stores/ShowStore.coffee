Fluxxor = require('fluxxor')
Constants = require('Constants')

module.exports = Fluxxor.createStore
  initialize: (options)->
    @shows = options.shows || []
    @bindActions(Constants.CREATE_SHOW, @handleCreateShow)
  getState: ->
    shows: @shows
  handleCreateShow: (args)->
    @shows.push(args.show)
    @emit('change')
