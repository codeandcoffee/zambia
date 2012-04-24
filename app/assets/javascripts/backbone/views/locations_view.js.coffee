class Zambia.Views.LocationsView extends Backbone.View
  template: JST["backbone/templates/locations"]

  el: '#locations'

  initialize: ->
    @collection.bind 'reset', @render
    @render()

  render: =>
    $(@el).html @template
    @locationView(location) for location in @collection.models
    @

  locationView: (location) ->
    location_view = new Zambia.Views.LocationView model: location
    $('#location-list').append location_view.render().el

class Zambia.Views.LocationView extends Backbone.View
  tagName: 'div'

  template: JST["backbone/templates/location"]

  events:
    'click .checkin': 'checkIn'

  render: =>
    $(@el).html @template {model: @model}
    @
  
  checkIn: ->
    console.log "checked in"
    console.log @model.get "city"
