React = require('react')
Nav = require('components/Nav')
R = React.DOM
require('main.scss')

module.exports = React.createClass
  render: ->
    R.div {className: 'pure-g'},
      R.nav {className: 'pure-u-1'},
        new Nav(null),
      @props.view
