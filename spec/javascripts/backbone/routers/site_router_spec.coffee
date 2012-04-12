describe "Zambia.Routers.SiteRouter", ->
  #describe "#welcome", ->
    #Given -> @$container = inject('main')
    #Given -> @welcome = fakeBone(Zambia.Views,"WelcomeView",['render'])
    #When -> @subject.welcome()
    #Then -> expect(@welcome.constructor).toHaveBeenCalledWith
      #el: @$container[0]
    #Then -> expect(@welcome.render).toHaveBeenCalled()

    #context "memoizing subsequent calls", ->
      #When -> @subject.welcome()
      #Then -> @welcome.constructor.callCount == 1
      #Then -> @welcome.render.callCount == 2
