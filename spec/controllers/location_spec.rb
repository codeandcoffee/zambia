require 'spec_helper'

describe LocationsController do

  describe "when calling the new action" do
    
    it "it should redirect to index with a notice on successful save" do
      Location.stub(:valid?).and_return(true)
      post :create, :name => "TEST LOCATION NAME"
      response.should redirect_to(:index)
    end
    
    it "should re-render new template on failed save" do
      Location.stub(:valid?).and_return(false)
      post :create, :name => "TEST LOCATION NAME"
      response.should render_template('new')
    end
  
  end
  
end
