React = require('react/addons')
FluxChildMixin = require('fluxxor').FluxChildMixin(React)
R = React.DOM

module.exports = React.createClass
  mixins: [FluxChildMixin, React.addons.LinkedStateMixin]
  propTypes:
    name: React.PropTypes.string.isRequired
    hummingbirdId: React.PropTypes.string.isRequired
  getInitialState: ->
    {tvdbId: '', seasonOverride: ''}
  handleCreate: (e)->
    e.preventDefault()
    console.log(@state)
    @getFlux().actions.createShow({
      name: @props.name
      hummingbirdId: @props.hummingbirdId
      tvdbId: @state.tvdbId
      onResponse: (response)=>
        @getFlux().actions.registerShow(response.args)
    })
  render: ->
    R.div className: 'col-md-5',
      R.form className: 'form-horizontal well', onSubmit: @handleCreate,
        R.div className: 'form-group',
          R.label htmlFor: 'tvdbId', className: 'col-lg-4 control-label',
            "TVDB Id"
          R.div className: 'col-lg-8',
            R.input type: 'text', className: 'form-control', valueLink: @linkState("tvdbId"),
          R.label htmlFor: 'tvdbId', className: 'col-lg-4 control-label',
            "TVDB Season"
          R.div className: 'col-lg-8',
            R.input type: 'text', className: 'form-control', valueLink: @linkState("seasonOverride"),
        R.div className: 'form-group',
          R.div className: 'col-lg-10 col-lg-offset-2',
            R.button type: 'submit', className: 'btn btn-primary',
              "Add"

