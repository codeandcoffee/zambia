require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "when initializing a contact" do
  before :each do
    @email = "spongebob@bikinibottom.rr.com"
    @body = "this is the body of the email"
    @name = "Spongebob Squarepants"
    @contact = Contact.new(@name, @email, @body)
  end

  it 'should have the contact name that was passed in' do
    @contact.name.should == @name
  end
  
  it 'should have the contact email that was passed in' do
    @contact.email.should == @email
  end

  it 'should have the email body that was passed in' do
    @contact.body.should == @body
  end
end
