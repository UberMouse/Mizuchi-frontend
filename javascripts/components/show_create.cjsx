React = require('react')
Fluxxor = require('fluxxor')
FluxMixin = Fluxxor.FluxChildMixin(React)
R = React.DOM

module.exports = React.createClass
  mixins: [FluxMixin]
  handleAddShow: (e)->
    e.preventDefault()
    showName = @refs.showName.getDOMNode().value
    @getFlux().actions.createShow(name: showName)

  render: ->
    R.div {className: 'pure-u-1'},
      R.form {className: 'pure-form'},
        R.fieldset null,
          R.legend null, 'Enter New Show'
          R.label {for: 'show-name'},
            R.input {type: 'text', name: 'show-name', ref: 'showName'}
          R.button {className: 'pure-button pure-button-primary', onClick: @handleAddShow}, 'Add Show'
