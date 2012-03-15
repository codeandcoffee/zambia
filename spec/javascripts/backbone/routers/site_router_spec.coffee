describe "Zambia.Routers.SiteRouter", ->
  Given -> @subject = new Zambia.Routers.SiteRouter
  Then -> expect(@subject.routes).toEqual
    "inquiry": "inquiry"
    "inquiry/:category": "inquiry"
    ".*": "welcome"

  describe "#inquiry", ->
    Given -> @inquiryView = fakeBone(Zambia.Views,"InquiryView",['render'])
    Given -> @inquiryModel = fakeBone(Zambia.Models,"Inquiry")
    When -> @subject.inquiry('foo-bar-baz')
    Then ->
      args = @inquiryView.constructor.mostRecentCall.args[0]
      expect(args.el).toEqual($('#contactUs.modal.hidden')[0])
      expect(args.model).toBeAnInstanceOf(Zambia.Models.Inquiry)
    Then -> expect(@inquiryModel.constructor).toHaveBeenCalledWith category: 'foo bar baz'
    Then -> expect(@inquiryView.render).toHaveBeenCalled()

    context "memoizing subsequent calls", ->
      When -> @subject.inquiry()
      Then -> @inquiryView.constructor.callCount == 1
      Then -> @inquiryView.render.callCount == 2

  describe "#welcome", ->
    Given -> @$container = inject('main')
    Given -> @welcome = fakeBone(Zambia.Views,"WelcomeView",['render'])
    When -> @subject.welcome()
    Then -> expect(@welcome.constructor).toHaveBeenCalledWith
      el: @$container[0]
    Then -> expect(@welcome.render).toHaveBeenCalled()

    context "memoizing subsequent calls", ->
      When -> @subject.welcome()
      Then -> @welcome.constructor.callCount == 1
      Then -> @welcome.render.callCount == 2
