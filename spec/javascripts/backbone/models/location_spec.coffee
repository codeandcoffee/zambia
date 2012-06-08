describe "Zambia.Models.Location", ->
  Given -> @collection = new Zambia.Collections.Locations(window.locationsData())
  Given -> @subject = @collection.get('cbus-staufs')

  describe "#dayAndTime", ->
    When -> @dayAndTime = @subject.dayAndTime()
    Then -> expect(@dayAndTime).toBe("Thursday @ 7:00")

    context "no day", ->
      Given -> @subject.set({day: null})
      When -> @dayAndTime = @subject.dayAndTime()
      Then -> expect(@dayAndTime).toBe("TBA")

    context "no time", ->
      Given -> @subject.set({time: null})
      When ->  @dayAndTime = @subject.dayAndTime()
      Then ->  expect(@dayAndTime).toBe("Thursday")

    context "nada", ->
      Given -> @subject = @collection.get('moon')
      When ->  @dayAndTime = @subject.dayAndTime()
      Then ->  expect(@dayAndTime).toBe("TBA")


