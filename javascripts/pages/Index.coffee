React = require('react')
Fluxxor = require('fluxxor')
_ = require('lodash')
FluxMixin = Fluxxor.FluxMixin(React)
StoreWatchMixin = Fluxxor.StoreWatchMixin
R = React.DOM

Show = React.createClass
  displayName: 'show'
  propTypes:
    name: React.PropTypes.string.isRequired
    hummingbirdId: React.PropTypes.string.isRequired
    tvdbId: React.PropTypes.string.isRequired
  render: ->
    R.tr null,
      R.td null,
        @props.tvdbId
      R.td null,
        @props.name
      R.td null,
        R.a href: 'http://thetvdb.com/?tab=series&id=' + @props.tvdbId,
          "Link"
      R.td null,
        R.a href: 'http://hummingbird.me/anime/' + @props.hummingbirdId,
          "Link"

module.exports = React.createClass
  mixins: [FluxMixin, StoreWatchMixin("ShowStore")]
  displayName: 'index'
  getStateFromFlux: ->
    flux = @getFlux()
    {shows: flux.store("ShowStore").getState().shows}
  render: ->
    shows = _.map @state.shows, (show)->
      new Show(show)
    R.table className: 'table table-striped table-hover',
      R.thead null,
        R.tr null,
          R.th null,
            "TVDB Id"
          R.th null,
            "Name"
          R.th null,
            "TVDB Link"
          R.th null,
            "Hummingbird Link"
      R.tbody null,
        shows
