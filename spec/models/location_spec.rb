require File.expand_path(File.dirname(__FILE__) + '/../spec_helper') 

describe "when checking the env" do
  it 'should be true' do
    true.should be_true
  end
end

describe Location do
  it { should have_field(:name) } 
  it { should have_field(:street1) } 
  it { should have_field(:street2) } 
  it { should have_field(:city) } 
  it { should have_field(:state) } 
  it { should have_field(:postalCode) } 
  it { should have_field(:hashtag) }
  it { should have_field(:isApproved) }
  
  it { should validate_presence_of(:name) }
end
