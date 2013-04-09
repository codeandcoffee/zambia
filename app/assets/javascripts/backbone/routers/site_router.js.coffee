class Zambia.Routers.SiteRouter extends Backbone.Router
  routes:
    ".*": "whereAndWhen"

  whereAndWhen: ->
    locations = new Zambia.Views.Locations
    $('.location-list').append(locations.render().el)
  
  # locations: ->
  #   @collection = new Zambia.Collections.Locations
  #   @collection.fetch()

  #   @locationsView ||= new Zambia.Views.LocationsView { collection: @collection }
  #   @todayLocationsView ||= new Zambia.Views.TodayLocationsView { collection: @collection }
  #   @tomorrowLocationsView ||= new Zambia.Views.TomorrowLocationsView { collection: @collection }
