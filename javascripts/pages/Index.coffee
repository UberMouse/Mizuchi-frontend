React = require('react')
Fluxxor = require('fluxxor')
FluxMixin = Fluxxor.FluxMixin(React)
StoreWatchMixin = Fluxxor.StoreWatchMixin

module.exports = React.createClass
  mixins: [FluxMixin, StoreWatchMixin("ShowStore")]
  getStateFromFlux: ->
    flux = @getFlux()
    {shows: flux.store("ShowStore").getState().shows}
  render: ->
    React.DOM.p null, "foo"
