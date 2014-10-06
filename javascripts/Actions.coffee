Constants = require('Constants')
ChangeCase = require('change-case')

module.exports = do ->
  actions = {}

  for actionName of Constants
    actions[ChangeCase.camelCase(actionName)] = (args)->
      @dispatch(Constants[actionName], args)
      
  actions