Fluxxor = require('fluxxor')
Constants = require('Constants')

module.exports = do ->
  @flux = null
  self = @
  Fluxxor.createStore
    initialize: (options)->
      @dispatcher = options.dispatcher
      for action of Constants
        @bindActions(action, @handleAction)
    handleAction: (payload, type)->
      foo =
        name: type,
        args: payload,
        id: "1"
      console.log(foo)
      @dispatcher.dispatch(foo)
      console.log("Got action with payload")
      console.log(payload)
      console.log("and type: #{type}")
    setFlux: (flux)->
      self.flux = flux