require File.expand_path(File.dirname(__FILE__) + '/../spec_helper') 

describe Post do
  it { should have_field(:author) } 
  it { should have_field(:body) }
  it { should have_field(:title) }
  it { should have_field(:slug) }
  it { should have_field(:intro) }

  it { should validate_presence_of(:author) }
  it { should validate_presence_of(:title) }
  #it { should validates_uniqueness_of(:slug) }

  describe "adding a new post" do
    it "should take the first 250 char and make the intro" do
      pending "add the character count spec"
    end

    it "should add an ellipsis to the end of the intro" do
      pending "add the ellipsis"
    end
  end
end
