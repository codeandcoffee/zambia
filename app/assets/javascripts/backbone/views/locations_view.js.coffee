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
    'click .map': 'mapPopover'

  render: =>
    $(@el).html @template {model: @model}
    @

  mapPopover: (e) ->
    title = "Map of " + @model.get "coffeeshop"
    embed_map = @model.get "map"
    link_map = (@model.get "map").replace /;output=embed/, ""
    content = '<iframe width="252" height="180" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="' + embed_map + '"></iframe><br /><small><a href="' + link_map + '" style="color:#0000FF;text-align:left">View Larger Map</a></small>'
    @$(".map").popover({
      title: title,
      content: content,
      placement: 'left',
      trigger: 'manual'
      })
    @$(".map").popover("toggle")

    e.preventDefault()
  
  checkIn: ->
    console.log "checked in"
    console.log @model.get "city"
    console.log @model.get "city"
