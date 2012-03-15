class Zambia.Routers.SiteRouter extends Backbone.Router
  routes:
    "inquiry": "inquiry"
    "inquiry/:category": "inquiry"
    ".*": "welcome"

  inquiry: (category = "") ->
    @inquiryView ||= new Zambia.Views.InquiryView
      el: $('<div id="contactUs" class="modal hidden"></div>').appendTo('body')[0]
      model: new Zambia.Models.Inquiry(category: category.replace(/\-/g,' '))
    @inquiryView.render()

  welcome: ->
    @welcomeView ||= new Zambia.Views.WelcomeView
      el: $('.main')[0]
    @welcomeView.render()
