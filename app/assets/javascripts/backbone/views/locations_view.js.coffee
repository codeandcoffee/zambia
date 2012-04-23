class Zambia.Views.LocationsView extends Backbone.View
  template: JST["backbone/templates/locations"]
  
  initialize: ->
    @collection = new Zambia.Collections.Locations
    @collection.add new Zambia.Models.Location
    @collection.add new Zambia.Models.Location { name: "Caribou", meet: "Tuesdays" }

  render: =>
    $(this.el).html @template
    @collection.each (location) ->
      location_view = new Zambia.Views.LocationView model: location
      $('#location-list').append location_view.render().el
    @

class Zambia.Views.LocationView extends Backbone.View
  tagName: 'li'

  render: =>
    $(@el).html "#{@model.get "name"} on #{@model.get "meet"}"
    @

