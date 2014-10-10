React = require('react/addons')
Fluxxor = require('fluxxor')
_ = require('lodash')
SearchResult = require('pages/components/SearchResult')
FluxMixin = Fluxxor.FluxMixin(React)

module.exports = React.createClass
  mixins: [FluxMixin, React.addons.LinkedStateMixin]
  getInitialState: ->
    {searchText: '', searchResults: []}
  handleSearch: ->
    @getFlux().actions.searchHummingbird({searchText: @state.searchText, onResponse: @handleSearchResults})
  handleSearchResults: (response)->
    console.log("handle search results")
    @setState({searchResults: response.args.results})

  render: ->
    R = React.DOM
    searchResults = _.map @state.searchResults, (result)->
      new SearchResult(result)

    R.div null,
      R.input type: 'text', valueLink: @linkState('searchText')
      R.button type: 'submit', onClick: @handleSearch,
        "Search"
      searchResults
