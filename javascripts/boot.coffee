React = require('react')
Fluxxor = require('fluxxor')
ShowStore = require('stores/ShowStore')
SyncStore = require('stores/SyncStore')
actions = require('Actions')
router = require('rrouter')
WebsocketHandler = require('WebsocketHandler')
Action = require('sync/Action')
SyncDispatcher = require('sync/Dispatcher')
Routes = router.Routes
Route = router.Route

window.React = React

InitAction = new Action('INIT', '')
InitAction.onResponse = (args)->
  syncStore = new SyncStore({handler: ws})
  stores =
    ShowStore: new ShowStore({shows: args.preload.shows})
    SyncStore: syncStore
  flux = new Fluxxor.Flux(stores, actions)
  window.flux = flux

  syncStore.setFlux(flux)
  Index = require('pages/index')
  CreateShow = require('pages/CreateShow')
  routes = (
    new Routes null,
      new Route({path: '/', view: Index, flux, name: 'index'}),
      new Route({path: '/create_show', view: CreateShow, flux, name: 'create_show'})
  )

  Layout = require('components/layout')

  router.start routes, (view)->
    React.renderComponent(new Layout({view}), document.getElementById("app"))

ws = new WebsocketHandler()
ws.start ->
  window.flux.actions.init()
