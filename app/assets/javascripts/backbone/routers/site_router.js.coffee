class TestDouble.Routers.SiteRouter extends Backbone.Router
  initialize: (options) ->
    $('.navigation').html(new TestDouble.Views.NavigationView().render())

  routes:
    "inquiry": "inquiry"
    "inquiry/:category": "inquiry"
    ".*": "welcome"

  inquiry: (category = "") ->
    @view = new TestDouble.Views.InquiryView({
      collection: new TestDouble.Collections.InquiriesCollection(),
      model: new TestDouble.Models.Inquiry(category: category.replace(/\-/g,' ') )})
    $(".main").html(@view.render().el)

  welcome: ->
    @view = new TestDouble.Views.WelcomeView()
    $(".main").html(@view.render().el)
