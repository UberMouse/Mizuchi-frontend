WebSocket = require('ws')

class websocket
  handleConnection = ->
    console.log("Connected to WebSocket")
  handleError = (err)->
    console.log("Connection error: #{err}")
  handleClose = ->
    console.log("Websocket connection closed")
  handleMessage = (message)->
    console.log("Recieved message: #{message.data}")

  start: =>
    @socket = new WebSocket('ws://localhost:9000/ws')

    @socket.onopen = handleConnection
    @socket.onerror = handleError
    @socket.onclose = handleClose
    @socket.onmessage = handleMessage

module.exports = websocket



