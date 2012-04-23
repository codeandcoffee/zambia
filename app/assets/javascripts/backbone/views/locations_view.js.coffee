class Zambia.Views.LocationsView extends Backbone.View
  template: JST["backbone/templates/locations"]
  
  initialize: ->
    _.bindAll @
    @collection = new Zambia.Collections.Locations
    one = new Zambia.Models.Location
    @collection.add new Zambia.Models.Location
    @collection.each (location) =>
      console.log location.get "name"
    #console.log @collection.models[0]

  render: ->
    $(this.el).html @template {collection: @collection}
    @collection.each (location) =>
      $('#location-list').append "<li>#{location.get "name"}</li>"
    @


