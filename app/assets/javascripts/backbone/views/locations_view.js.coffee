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

class Zambia.Views.TodayLocationsView extends Backbone.View
  template: JST["backbone/templates/today_locations"]

  el: '#today'

  initialize: ->
    @collection.bind 'reset', @render
    @render()

  render: =>
    $(@el).html @template
    @todayView(location) for location in @collection.models
    @

  todayView: (location) ->
    if location.get "isToday"
      $('#today-list').append "<p>" + location.get("city") + "</p>"

class Zambia.Views.TomorrowLocationsView extends Backbone.View
  template: JST["backbone/templates/tomorrow_locations"]
  
  el: '#tomorrow'

  initialize: ->
    @collection.bind 'reset', @render
    @render()

  render: =>
    $(@el).html @template
    @tomorrowView(location) for location in @collection.models
    @

  tomorrowView: (location) ->
    if location.get "isTomorrow"
      $('#tomorrow-list').append "<p>" + location.get("city") + "</p>"


