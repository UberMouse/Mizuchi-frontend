# Action {
#   name: 'Action Name'
#   args: '{json_string: 1}'
#   onResponse: (args)->
# }

class Action
  constructor: (@name, @args)->


module.exports = Action