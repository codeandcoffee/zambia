require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ContactMailer do
  before :each do
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []
  end

  describe "When sending a contact email" do
    before :each do
      @name = "Spongebob Squarepants"
      @email = "spongebob@bikinibottom.rr.com"
      @body = "Code and coffee at the Krusty Krab"
      @contact = Contact.new(@name, @email, @body)
      
      @mail = ContactMailer.contact_email(@contact).deliver
    end

    it 'the delivery array should have a size of one' do
      ActionMailer::Base.deliveries.size.should be 1
    end

    it 'should have the correct subject' do
      @mail.subject.should == "Code and Coffee Contact message"
    end

    it 'the body should contain the text in the body of the message' do
      @mail.encoded.include?(@body).should be_true 
    end

    it 'should have the contact name in the body of the message' do
      @mail.encoded.include?(@name).should be_true
    end

    it 'should have tim@timwingfield.com as the to address' do
      @mail.to.first.should == "tim@timwingfield.com"
    end

    it 'should have the contact address as the from address' do
      @mail.from.first.should == @email
    end
  end
end
