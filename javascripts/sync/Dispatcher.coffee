WebsocketHandler = require('WebsocketHandler')

class Dispatcher
  sendQueue = []
  handleServerMessage = (message)->
    console.log(message)
  processQueueItem = (ws)->
    action = sendQueue.shift()
    ws.send action
  constructor: (@ws)->
    @ws.registerCallback handleServerMessage
    # todo fix this, calling start in the constructor is Bad™
    @ws.start =>
      cb = =>
        processQueueItem(@ws)
      @intervalId = setInterval(cb, 50)

  dispatch: (action)->
    console.log(action)
    sendQueue.push(action)


module.exports = new Dispatcher(new WebsocketHandler())

# problem
# need to always get same dispatcher instance when you require('sync/Dispatcher')
# solution:
# return constructed Dispatcher instance as module export
# issues:
# how to move websocket creation externally