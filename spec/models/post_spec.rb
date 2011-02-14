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
end
