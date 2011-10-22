class TestDouble.Routers.InquiriesRouter extends Backbone.Router
  initialize: (options) ->
    @inquiries = new TestDouble.Collections.InquiriesCollection()
    @inquiries.reset options.inquiries

  routes:
    "/new"      : "newInquiry"
    "/index"    : "index"
    "/:id/edit" : "edit"
    "/:id"      : "show"
    ".*"        : "index"

  newInquiry: ->
    @view = new TestDouble.Views.Inquiries.NewView(collection: @inquiries)
    $("#inquiries").html(@view.render().el)

  index: ->
    @view = new TestDouble.Views.Inquiries.IndexView(inquiries: @inquiries)
    $("#inquiries").html(@view.render().el)

  show: (id) ->
    inquiry = @inquiries.get(id)
    
    @view = new TestDouble.Views.Inquiries.ShowView(model: inquiry)
    $("#inquiries").html(@view.render().el)
    
  edit: (id) ->
    inquiry = @inquiries.get(id)

    @view = new TestDouble.Views.Inquiries.EditView(model: inquiry)
    $("#inquiries").html(@view.render().el)
  