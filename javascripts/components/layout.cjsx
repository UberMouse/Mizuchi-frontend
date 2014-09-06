React = require('react')
Nav = require('components/nav')
R = React.DOM
require('main.sass')

module.exports = React.createClass
  render: ->
    R.div {className: 'pure-g'},
      R.nav {className: 'pure-u-1'},
        new Nav(null),
      @props.view
