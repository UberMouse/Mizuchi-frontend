Fluxxor = require('fluxxor')
Constants = require('Constants')

module.exports = do ->
  @flux = null
  self = @
  Fluxxor.createStore
    initialize: (options)->
      @ws_handler = options.handler
      @ws_handler.registerCallback(@handleServerMessage)
      for action of Constants
        @bindActions(action, @handleAction)
    handleServerMessage: (message)->
      action_message = JSON.parse(message.data)
      self.flux.actions[action_message.name](action_message.args)
    handleAction: (payload, type)->
      foo = JSON.stringify(
        name: type,
        args: JSON.stringify(payload),
        id: "1"
      )
      console.log(foo)
      @ws_handler.send(foo)
      console.log("Got action with payload")
      console.log(payload)
      console.log("and type: #{type}")
    setFlux: (flux)->
      self.flux = flux