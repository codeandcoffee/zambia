describe "TestDouble.Models.Inquiry", ->
  Given -> @subject = new TestDouble.Models.Inquiry
  Then -> @subject.paramRoot == 'inquiry'