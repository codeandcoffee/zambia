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
      sub_view = new Zambia.Views.TodayTomorrowLocationView model: location
      $('#today-list').append sub_view.render().el

