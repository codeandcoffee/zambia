class ContactMailer < ActionMailer::Base
  def contact_email(contact)
    @email_body = contact.body
    @name = contact.name

    mail(:to => "tim@timwingfield.com",
         :subject => "Code and Coffee Contact message",
         :from => contact.email)
  end
end
