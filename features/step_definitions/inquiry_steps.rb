DATA = {
  :name => 'Joe Beans',
  :businessType => 'a mid-size business',
  :category => 'build an application',
  :phone => '123-456-7890',
  :email => 'joe@beans.com',
  :contactPreference => 'e-mail'
}

def fill_it_out(data = {})
  @inquiry_fields = DATA.merge(data)
  @inquiry_fields.each do |(name,value)|
    case find("[name=\"#{name}\"]").tag_name
    when "input"
      fill_in name.to_s, :with => value
    when "select"
      select value, :from => name.to_s
    when "textarea"
      fill_in name.to_s, :with => value
    end
  end
end

def contact_us_button
  find('#contactUsButton')
end

def send_inquiry(data)
  contact_us_button.click
  fill_it_out data
  click_button "contact us"
end

def wait_up_to(seconds)
  og = Capybara.default_wait_time
  Capybara.default_wait_time = seconds
  yield
  Capybara.default_wait_time = og
end

Given /^I'm at the website\.$/ do
 visit '/'
end

When /^a user contacts us wanting an app\.$/ do
  send_inquiry :applicationType => 'mobile',
               :applicationBudget => '$30,000',
               :applicationContract => 'you may resell the app (lowest rates)'
end

Then /^we get an e\-mail about it\.$/ do
  wait_up_to(10) { page.should have_no_content 'Greetings' }

  mail = ActionMailer::Base.deliveries.last
  mail.to.should include "searls+testdouble@gmail.com"
  mail.to.should include "toddkaufman+testdouble@gmail.com"
  mail.subject.should == "New test double inquiry!"
  @inquiry_fields.each do |(name,value)|
    mail.body.should include value
  end
end

When /^a user contacts us wanting training\.$/ do
  send_inquiry :category => 'receive training',
               :trainingFormat => 'public',
               :trainingTopic => 'Backbone, Rails, and COBOL',
               :trainingGroupSize => '7 - 15'
end

When /^a user contacts us wanting to talk\.$/ do
  send_inquiry :category => 'talk with you',
               :discussionTopic => "I'm more than happy to discuss anything at all! Yay!"
end

When /^a user opens the contact form\.$/ do
  pending # express the regexp above with the code you wish you had
end

When /^then they cancel\.$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^they're back at the home screen\.$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^we don't get an e\-mail about it\.$/ do
  pending # express the regexp above with the code you wish you had
end