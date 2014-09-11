React = require('react')
Fluxxor = require('fluxxor')
ShowStore = require('stores/show_store')
SyncStore = require('stores/sync_store')
actions = require('actions')
router = require('rrouter')
WebsocketHandler = require('websocket_handler')
Routes = router.Routes
Route = router.Route

window.React = React
ws = new WebsocketHandler()
ws.start()

shows = [{
  name: 'Akame ga Kill!'
}, {
  name: 'Gekkan Shoujo Nozaki-kun'
}, {
  name: 'Hunter x Hunter'
}];

syncStore = new SyncStore({handler: ws})
stores =
  ShowStore: new ShowStore({shows})
  SyncStore: syncStore
flux = new Fluxxor.Flux(stores, actions)

syncStore.setFlux(flux)
Index = require('pages/index')
CreateShow = require('pages/create_show')
routes = (
  new Routes null,
    new Route({path: '/', view: Index, flux, name: 'index'}),
    new Route({path: '/create_show', view: CreateShow, flux, name: 'create_show'})
)

Layout = require('components/layout')

router.start routes, (view)->
  React.renderComponent(new Layout({view}), document.body)
