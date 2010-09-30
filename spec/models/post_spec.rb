require File.expand_path(File.dirname(__FILE__) + '/../spec_helper') 

describe "when checking the env" do
  it 'should be true' do
    true.should be_true
  end
end

describe Post do
  it { should have_field(:author) } 
  it { should have_field(:body) }
  it { should have_field(:title) }
  it { should have_field(:slug) }
end
