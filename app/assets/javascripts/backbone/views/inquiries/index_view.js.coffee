TestDouble.Views.Inquiries ||= {}

class TestDouble.Views.Inquiries.IndexView extends Backbone.View
  template: JST["backbone/templates/inquiries/index"]
    
  initialize: () ->
    _.bindAll(this, 'addOne', 'addAll', 'render')
    
    @options.inquiries.bind('reset', @addAll)
   
  addAll: () ->
    @options.inquiries.each(@addOne)
  
  addOne: (inquiry) ->
    view = new TestDouble.Views.Inquiries.InquiryView({model : inquiry})
    @$("tbody").append(view.render().el)
       
  render: ->
    $(@el).html(@template(inquiries: @options.inquiries.toJSON() ))
    @addAll()
    
    return this