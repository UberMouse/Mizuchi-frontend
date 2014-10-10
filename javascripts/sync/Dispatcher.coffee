WebsocketHandler = require('WebsocketHandler')
_ = require('lodash')

class Dispatcher
  sendQueue = []
  responseMappings = {}
  handleServerMessage = (message)->
    action = JSON.parse(message)
    action.args = JSON.parse(action.args)
    console.log(action)
    if(responseMappings[action.id])
      responseMappings[action.id](action)
  processQueueItem = (ws)->
    if(sendQueue.length == 0)
      return
    action = sendQueue.shift()
    action.args = JSON.stringify(action.args)
    ws.send JSON.stringify(action)
  generateId = ->
    nums = _.map _.range(10), ->
      _.random(0, 9, false)
    nums.join("")
  constructor: (@ws)->
    @ws.registerCallback handleServerMessage
    # todo fix this, calling start in the constructor is Bad™
    @ws.start =>
      cb = =>
        processQueueItem(@ws)
      @intervalId = setInterval(cb, 50)

  dispatch: (action)->
    if(!action.id)
      action.id = generateId()
    console.log(action)
    sendQueue.push(action)
    responseMappings[action.id] = action.args.onResponse


module.exports = new Dispatcher(new WebsocketHandler())

# problem
# need to always get same dispatcher instance when you require('sync/Dispatcher')
# solution:
# return constructed Dispatcher instance as module export
# issues:
# how to move websocket creation externally