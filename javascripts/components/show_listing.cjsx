React = require('react')
R = React.DOM

module.exports = React.createClass
  render: ->
    R.tr null,
      R.td null, @props.show.name
