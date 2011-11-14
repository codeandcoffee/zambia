describe "TestDouble.Views.WelcomeView", ->
  Given -> @subject = new TestDouble.Views.WelcomeView
  Then -> expect(@subject.events).toEqual
    "click #contactUsButton": "contactUs"
  Then -> @subject.template == JST["backbone/templates/welcome"]

  describe "#render", ->
    Given -> spyOn(@subject, "template").andReturn '<div>foo</div>'
    When -> @result = @subject.render()
    Then -> expect($(@subject.el)).toHaveHtml '<div>foo</div>'
    Then -> @result == @subject

  describe "#contactUs", ->
    Given -> fakify(window,"router",jasmine.createSpyObj('router',['navigate']))
    When -> @subject.contactUs()
    Then -> expect(window.router.navigate).toHaveBeenCalledWith('inquiry',true)