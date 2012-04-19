describe "Zambia.Views.LocationsView", ->
  Given -> @subject = new Zambia.Views.LocationsView
  Then -> @subject.template == "backbone/templates/locations"

