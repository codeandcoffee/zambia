class TestDouble.Routers.SiteRouter extends Backbone.Router
  initialize: (options) ->
    $('.navigation').html(new TestDouble.Views.NavigationView().render())

  routes:
    "inquiry": "inquiry"
    ".*": "welcome"

  inquiry: ->
    @view = new TestDouble.Views.InquiryView({collection: new TestDouble.Collections.InquiriesCollection()})
    $(".main").html(@view.render().el)

  welcome: ->
    @view = new TestDouble.Views.WelcomeView()
    $(".main").html(@view.render().el)
