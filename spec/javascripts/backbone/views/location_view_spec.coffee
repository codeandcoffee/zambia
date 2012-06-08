describe 'Zambia.Views.LocationView', ->
  Given ->
    @data =
      city: 'Ashland'
      coffeeshop: 'Staufs'
      day: 'Monday'
      time: '9:00'
    @model = new Zambia.Models.Location @data
      
  Given -> @subject = new Zambia.Views.LocationView
    model: @model
  Then -> expect(@subject).toBeDefined()

  describe '#render', ->
    Given ->
      spyOn($.fn, 'html')
      spyOn(@subject, 'template')
    When -> @result = @subject.render()
    Then -> @result == @subject
    Then -> expect($.fn.html).toHaveBeenCalledWith @subject.template()
    Then -> 
      expect(@subject.template).toHaveBeenCalledWith(
        city: 'Ashland', coffeeshop: 'Staufs', dayAndTime: 'Monday @ 9:00')
