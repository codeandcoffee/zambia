describe "Zambia.Routers.SiteRouter", ->
  describe "routes", ->
    Given -> @subject = new Zambia.Routers.SiteRouter
    Given -> affix('.location-list')
    Then -> expect(@subject.routes).toEqual
      ".*": "whereAndWhen"

    describe "#whereAndWhen", ->
      Given -> @doneSpy = jasmine.createSpy()
      Given -> @collectionSpy = spyOnConstructor(Zambia.Collections, 'Locations', ['fetch'])
      Given -> @collectionSpy.fetch.andReturn(done: @doneSpy)
      When -> @subject.whereAndWhen()
      Then -> expect(@doneSpy).toHaveBeenCalled()

    describe "#showLocations", ->
      Given -> @subject.locationList = new Backbone.Collection
      Given -> @viewSpy = spyOnConstructor(Zambia.Views, 'Locations', ['render'])
      Given -> @viewSpy.render.andReturn(el: '<div class="spongebob"></div>')
      When -> @subject.showLocations()
      Then -> expect(@viewSpy.render).toHaveBeenCalled()
      Then -> expect($('.location-list').html()).toContain('spongebob')
