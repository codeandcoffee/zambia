class Zambia.Routers.SiteRouter extends Backbone.Router
  routes:
    ".*": "welcome"

  welcome: ->
    @welcomeView ||= new Zambia.Views.WelcomeView
      el: $('#about')[0]
    @welcomeView.render()
