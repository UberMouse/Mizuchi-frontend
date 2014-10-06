React = require('react')
Fluxxor = require('fluxxor')
FluxMixin = Fluxxor.FluxMixin(React)

module.exports = React.createClass
  mixins: [FluxMixin]
  render: ->
    R.p null, "bar"
