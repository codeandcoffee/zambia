class TestDouble.Routers.SiteRouter extends Backbone.Router
  initialize: (options) ->

  routes:
    "/inquiry": "inquiry"
    ".*": "index"

  inquiry: ->
    @view = new TestDouble.Views.InquiryView({collection: new TestDouble.Collections.InquiriesCollection()})
    $("#inquiries").html(@view.render().el)

  index: ->
    $('body').html('o hai!')