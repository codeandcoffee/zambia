class TestDouble.Routers.SiteRouter extends Backbone.Router
  routes:
    "inquiry": "inquiry"
    "inquiry/:category": "inquiry"
    ".*": "welcome"

  inquiry: (category = "") ->
    @inquiryView ||= new TestDouble.Views.InquiryView
      el: $('.main')
      collection: new TestDouble.Collections.InquiriesCollection(),
      model: new TestDouble.Models.Inquiry(category: category.replace(/\-/g,' '))
    @inquiryView.render()

  welcome: ->
    @welcomeView ||= new TestDouble.Views.WelcomeView
      el: $('.main')
    @welcomeView.render()
