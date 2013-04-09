describe "Zambia.Routers.SiteRouter", ->
  describe "routes", ->
    Given -> @subject = new Zambia.Routers.SiteRouter
    Given -> affix('.location-list')
    Then -> expect(@subject.routes).toEqual
      ".*": "whereAndWhen"

    describe "whereAndWhen", ->
      Given -> @viewSpy = spyOnConstructor(Zambia.Views, 'Locations', ["render"])
      Given -> @viewSpy.render.andReturn el: $('<div class="spongebob"></div>')
      When -> @subject.whereAndWhen()
      Then -> expect($('.location-list').html()).toContain('<div class="spongebob">')
