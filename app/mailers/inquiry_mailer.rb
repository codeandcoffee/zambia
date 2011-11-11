class InquiryMailer < ActionMailer::Base
  default from: "testdouble@heroku.com"

  def inquiry_email(inquiry)
    @inquiry = inquiry
    mail(:to => "searls+testdouble@gmail.com,toddkaufman+testdouble@gmail.com", :subject => "New test double inquiry!")
  end
end
