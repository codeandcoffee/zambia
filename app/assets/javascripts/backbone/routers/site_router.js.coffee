class TestDouble.Routers.SiteRouter extends Backbone.Router
  initialize: (options) ->
    $('.navigation').html(new TestDouble.Views.NavigationView().render())

  routes:
    "inquiry": "inquiry"
    "inquiry/:category": "inquiry"
    ".*": "welcome"

  inquiry: (category = "") ->
    if !@inquiryView
      @inquiryView = new TestDouble.Views.InquiryView
        el: $('.main')
        collection: new TestDouble.Collections.InquiriesCollection(),
        model: new TestDouble.Models.Inquiry(category: category.replace(/\-/g,' '))
      @inquiryView.render()
    # $(".main").html(@inquiryView.el)

  welcome: ->
    @view = new TestDouble.Views.WelcomeView()
    $(".main").html(@view.render().el)
