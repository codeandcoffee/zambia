describe "TestDouble.Views.InquiryView", ->
  Given -> spyOn(_, "bindAll")
  Given -> @model = jasmine.createSpyObj('model',['bind','get'])
  Given -> @subject = new TestDouble.Views.InquiryView model: @model


  Then -> expect(@subject.template).toBe(JST["backbone/templates/inquiry"])
  Then -> expect(@subject.categories).toEqual [
    "build an application",
    "receive training",
    "talk with you"]

  context "binding stuff", ->
    Then -> expect(_.bindAll).toHaveBeenCalledWith @subject

  describe "#render", ->
    describe "basic rendering", ->
      HTML = '<div>foo</div>'
      Given -> spyOn($.fn, "fadeIn")
      Given -> spyOn(@subject, "template").when(model: @model, view: @subject).thenReturn HTML
      Given -> spyOn(TestDouble.Views.InquiryView.__super__, "render")
      When -> @result = @subject.render()
      Then -> expect($(@subject.el)).toHaveHtml HTML
      Then -> expect($.fn.fadeIn).toHaveBeenCalledWith(500)
      Then -> expect(TestDouble.Views.InquiryView.__super__.render).toHaveBeenCalled()
      Then -> @result == @subject

    describe "showing the selected category's fields", ->
      CATEGORY_NAME='foo'
      OTHER_CATEGORY_NAME='bar'
      Given -> @$container = inject('main')
      Given -> @$selectedCategory = @$container.inject("category #{CATEGORY_NAME}")
      Given -> @$otherCategory = @$container.inject("category #{OTHER_CATEGORY_NAME}")
      Given -> @$select = @$container.inject({el:'select',attrs:{name:'category'}})
      Given -> @$select.inject({el:'option', cssClass: CATEGORY_NAME, attrs:{selected: 'selected'}})
      Given -> spyOn(@subject, "template").andReturn(@$container)
      When -> @subject.render()
      Then -> expect(window.router.navigate).toHaveBeenCalledWith("inquiry/#{CATEGORY_NAME}")
      Then -> expect(@$selectedCategory).not.toHaveClass('hidden')
      Then -> expect(@$otherCategory).toHaveClass('hidden')

  describe "#save", ->
  describe "#afterSending", ->
  describe "#cancel", ->


