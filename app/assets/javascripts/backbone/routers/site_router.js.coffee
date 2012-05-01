class Zambia.Routers.SiteRouter extends Backbone.Router
  routes:
    ".*": "main"

  main: ->
    @welcome()
    @locations()
  
  welcome: ->
    @welcomeView ||= new Zambia.Views.WelcomeView
    
  locations: ->
    @collection = new Zambia.Collections.Locations
    @collection.fetch()

    @locationsView ||= new Zambia.Views.LocationsView { collection: @collection }
    @todayLocationsView ||= new Zambia.Views.TodayLocationsView { collection: @collection }
    @tomorrowLocationsView ||= new Zambia.Views.TomorrowLocationsView { collection: @collection }
