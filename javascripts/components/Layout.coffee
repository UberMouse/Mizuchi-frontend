React = require('react')
Nav = require('components/Nav')
R = React.DOM
require('main.scss')

module.exports = React.createClass
  render: ->
    R.div null,
      R.nav null,
        new Nav()
      R.div {className: 'col-md-12'},
        @props.view
