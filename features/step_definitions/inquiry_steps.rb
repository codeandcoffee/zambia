DATA = {
  :name => 'Joe Beans',
  :businessType => 'a mid-size business',
  :category => 'build an application',
  :applicationType => 'mobile',
  :applicationBudget => '$30,000',
  :applicationContract => 'you may resell the app (lowest rates)',
  :phone => '123-456-7890',
  :email => 'joe@beans.com',
  :contactPreference => 'e-mail'
}

def fill_it_out(data = {})
  DATA.merge(data).each do |(name,value)|
    case find("[name=\"#{name}\"]").tag_name
    when "input"
      fill_in name.to_s, :with => value
    when "select"
      select value, :from => name.to_s
    end
  end
end

Given /^I'm at the website\.$/ do
 visit '/'
end

When /^a user contacts us wanting an app\.$/ do
  find('#contactUsButton').click
  fill_it_out
end

Then /^we get an e\-mail about it\.$/ do

end

When /^a user contacts us wanting training\.$/ do
  pending # express the regexp above with the code you wish you had
end

When /^a user contacts us wanting to talk\.$/ do
  pending # express the regexp above with the code you wish you had
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