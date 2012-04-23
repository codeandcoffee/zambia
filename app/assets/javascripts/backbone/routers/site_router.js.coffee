class Zambia.Routers.SiteRouter extends Backbone.Router
  routes:
    ".*": "main"

  main: ->
    @welcome()
    @locations()
  
  welcome: ->
    @welcomeView ||= new Zambia.Views.WelcomeView
      el: $('#about')[0]
    @welcomeView.render()
    
  locations: ->
    @locationsView ||= new Zambia.Views.LocationsView
      el: $('#locations')[0]
    @locationsView.render()

