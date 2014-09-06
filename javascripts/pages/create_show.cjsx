React = require('react')
Fluxxor = require('fluxxor')
FluxMixin = Fluxxor.FluxMixin(React)
ShowCreate = require('components/show_create')

module.exports = React.createClass
  mixins: [FluxMixin]
  render: ->
    new ShowCreate(null)
