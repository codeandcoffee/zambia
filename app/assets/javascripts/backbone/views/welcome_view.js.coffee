class TestDouble.Views.WelcomeView extends Backbone.View
  template: JST["backbone/templates/welcome"]()

  events: ->
    "click #contactUs": "contactUs"

  render: ->
    $(this.el).html(@template)
    @

  contactUs: ->
    window.router.navigate('inquiry',true)