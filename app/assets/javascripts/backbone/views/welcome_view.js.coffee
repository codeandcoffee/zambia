class Zambia.Views.WelcomeView extends Backbone.View
  template: JST["backbone/templates/welcome"]

  render: ->
    $(this.el).html(@template())
    @
