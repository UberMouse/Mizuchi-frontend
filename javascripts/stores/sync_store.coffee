Fluxxor = require('fluxxor')
Constants = require('constants')

module.exports = do ->
  @flux = null
  self = @
  Fluxxor.createStore
    initialize: (options)->
      @ws_handler = options.handler
      @ws_handler.registerCallback(@handleMessage)
      for action of Constants.Synced
        @bindActions(action, @handleAction)
    handleMessage: (message)->
      action_message = JSON.parse(message.data)
      self.flux.actions[action_message.action_name](action_message.args)
    handleAction: (payload, type)->
      foo = JSON.stringify(
        action_name: type,
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