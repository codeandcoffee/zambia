describe "Zambia.Models.Location", ->
  Given -> @subject = new Zambia.Models.Location {day: 'Thursday', time: '7:00'}

  describe "#dayAndTime", ->
    context "both day and time", ->
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
      Given -> @subject.set({day: null, time: null})
      When ->  @dayAndTime = @subject.dayAndTime()
      Then ->  expect(@dayAndTime).toBe("TBA")
