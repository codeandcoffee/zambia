class Zambia.Routers.SiteRouter extends Backbone.Router
  routes:
    ".*": "whereAndWhen"

  whereAndWhen: ->
    @locationList = new Zambia.Collections.Locations
    @locationList.fetch().done @showLocations

  showLocations: =>
    locations = new Zambia.Views.Locations collection: @locationList
    $('.location-list').append(locations.render().el)
      
