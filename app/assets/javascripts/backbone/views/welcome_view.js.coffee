class Zambia.Views.WelcomeView extends Backbone.View
  template: JST["backbone/templates/welcome"]
  el: '#about'

  initialize: ->
    @render()

  render: ->
    $(@el).html @template()
    @
