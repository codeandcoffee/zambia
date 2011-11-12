describe "TestDouble.Models.Inquiry", ->
  Given -> @subject = new TestDouble.Models.Inquiry
  Then -> @subject.paramRoot == 'inquiry'

describe "TestDouble.Collections.InquiriesCollection", ->
  Given -> @subject = new TestDouble.Collections.InquiriesCollection
  Then -> @subject.model == TestDouble.Models.Inquiry
  Then -> @subject.url == '/inquiries'