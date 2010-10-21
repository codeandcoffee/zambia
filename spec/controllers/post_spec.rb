require File.expand_path(File.dirname(__FILE__) + '/../spec_helper') 

describe PostController do
  
  it "should render the index view when the post is not found" do
    get :show , :slug => 'I AM NOT HERE'
    response.should render_template('index')
  end
  
  it "should render the show view when the post is found" do
    get :show, :slug => 'Shawn'
    response.should render_template('show')
  end
end