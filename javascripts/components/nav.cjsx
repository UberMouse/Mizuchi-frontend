React = require('react')
Link = require('rrouter').Link
R = React.DOM

module.exports = React.createClass
  render: ->
    R.div {className: 'pure-menu pure-menu-open pure-menu-horizontal'},
      R.ul null,
        R.li null, new Link({to: '/index'}, 'Index'),
        R.li null, new Link({to: '/create_show'}, 'Create Show')
