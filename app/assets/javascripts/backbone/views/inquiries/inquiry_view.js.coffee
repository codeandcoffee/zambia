TestDouble.Views.Inquiries ||= {}

class TestDouble.Views.Inquiries.InquiryView extends Backbone.View
  template: JST["backbone/templates/inquiries/inquiry"]
  
  events:
    "click .destroy" : "destroy"
      
  tagName: "tr"
  
  destroy: () ->
    @model.destroy()
    this.remove()
    
    return false
    
  render: ->
    $(this.el).html(@template(@model.toJSON() ))    
    return this