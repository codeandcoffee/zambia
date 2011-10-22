TestDouble.Views.Inquiries ||= {}

class TestDouble.Views.Inquiries.ShowView extends Backbone.View
  template: JST["backbone/templates/inquiries/show"]
   
  render: ->
    $(this.el).html(@template(@model.toJSON() ))
    return this