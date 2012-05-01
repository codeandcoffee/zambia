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
      sub_view = new Zambia.Views.TodayTomorrowLocationView model: location
      $('#tomorrow-list').append sub_view.render().el
