React = require('react/addons')
Fluxxor = require('fluxxor')
_ = require('lodash')
SearchResult = require('pages/components/SearchResult')
ShowCreationForm = require('pages/components/ShowCreationForm')
FluxMixin = Fluxxor.FluxMixin(React)

R = React.DOM

CombinedSearchResult = React.createClass
  propTypes:
    result: React.PropTypes.object.isRequired
  displayName: 'combinedSearchResult'
  render: ->
    R.div className: 'panel panel-default',
      R.div className: 'panel-body',
        new ShowCreationForm(@props.result),
        new SearchResult(@props.result)
      R.div className: 'panel-footer',
        R.span null,
          @props.result.name


module.exports = React.createClass
  mixins: [FluxMixin, React.addons.LinkedStateMixin]
  displayName: 'createShow'
  getInitialState: ->
    {searchText: '', searchResults: []}
  handleSearch: (e)->
    e.preventDefault()
    @getFlux().actions.searchHummingbird({searchText: @state.searchText, onResponse: @handleSearchResults})
  handleSearchResults: (response)->
    @setState({searchResults: response.args.results})

  render: ->
    searchResults = _.map @state.searchResults, (result)->
      R.div className: 'col-md-6',
        new CombinedSearchResult({result})
        

    R.div null,
      R.form onSubmit: @handleSearch,
        R.input type: 'text', valueLink: @linkState('searchText'),
        R.button type: 'submit',
          "Search"
      R.hr null
      searchResults
