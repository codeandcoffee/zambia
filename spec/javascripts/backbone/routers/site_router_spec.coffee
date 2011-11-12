describe "TestDouble.Routers.SiteRouter", ->
  Given -> @subject = new TestDouble.Routers.SiteRouter
  Then -> expect(@subject.routes).toEqual
    "inquiry": "inquiry"
    "inquiry/:category": "inquiry"
    ".*": "welcome"

  describe "#inquiry", ->

  describe "#welcome", ->


