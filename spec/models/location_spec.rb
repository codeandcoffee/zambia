require File.expand_path(File.dirname(__FILE__) + '/../spec_helper') 

describe Location do
  it { should have_field(:name) } 
  it { should have_field(:street1) } 
  it { should have_field(:street2) } 
  it { should have_field(:city) } 
  it { should have_field(:state) } 
  it { should have_field(:postalCode) } 
  it { should have_field(:hashtag) }
  it { should have_field(:isApproved) }
  it { should have_field(:dayOfWeek) }
  it { should have_field(:time) }
  
  it { should validate_presence_of(:name) }
  
  it { should validate_format_of(:email_address) }

  describe "when checking if the location has a good address" do
    it 'should be falls when new' do
      instance = Location.new
      instance.goodAddress?.should == false
    end

    [
      [nil, nil, false],
      ["GOOD STREET", nil, false],
      [nil, "GOOD CITY", false],
      ["GOOD STREET", "GOOD CITY", true]
    ].each do |street1, city, expected|
      it "should be #{expected} when street1 is '#{street1}' and city is '#{city}'" do
        instance = Location.new
        instance.street1 = street1
        instance.city = city
        instance.goodAddress?.should == expected
      end
    end
  end
end

