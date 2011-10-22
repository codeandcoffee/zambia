TestDouble.Views.Inquiries ||= {}

class TestDouble.Views.Inquiries.EditView extends Backbone.View
  template : JST["backbone/templates/inquiries/edit"]
  
  events :
    "submit #edit-inquiry" : "update"
    
  update : (e) ->
    e.preventDefault()
    e.stopPropagation()
    
    @model.save(null,
      success : (inquiry) =>
        @model = inquiry
        window.location.hash = "/#{@model.id}"
    )
    
  render : ->
    $(this.el).html(this.template(@model.toJSON() ))
    
    this.$("form").backboneLink(@model)
    
    return this