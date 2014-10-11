React = require('react')
R = React.DOM

module.exports = React.createClass
  propTypes:
    poster_url: React.PropTypes.string.isRequired
    show_url: React.PropTypes.string.isRequired

  render: ->
    R.a href: @props.show_url,
      R.img src: @props.poster_url, width: "400"
