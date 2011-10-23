class TestDouble.Views.NavigationView extends Backbone.View
  template: JST["backbone/templates/navigation"]

  links:
    "#": 'Test Double',
    "#inquiry": 'Contact Us'

  render: ->
    $(this.el).html(@template(@))