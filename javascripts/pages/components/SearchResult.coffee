React = require('react')
R = React.DOM

module.exports = React.createClass
  propTypes:
    name: React.PropTypes.string.isRequired
    poster_url: React.PropTypes.string.isRequired
    show_url: React.PropTypes.string.isRequired
  render: ->
    R.div className: 'panel panel-default',
      R.div className: 'panel-body',
        R.a href: @props.show_url,
          R.img src: @props.poster_url
      R.div className: 'panel-footer',
        R.span null,
          @props.name
