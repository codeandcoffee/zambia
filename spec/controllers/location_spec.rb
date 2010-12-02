require 'spec_helper'

describe LocationController do

  context "when calling the new action" do
    
    it "should redirect to index on successful save" do
      mockOutSaveOnNewLocation(true)
      post :create, :location => { "name" => "TEST LOCATION NAME" }
      response.should redirect_to(:action => "index")
    end
    
    it "should re-render new template on failed save" do
      mockOutSaveOnNewLocation(false)
      post :create, :location => { "name" => "TEST LOCATION NAME" }
      response.should render_template('new')
    end
  
  end
  
end

def mockOutSaveOnNewLocation(saveSucceeds)
  @newLocation = Location.new()
  @newLocation.stub!(:save).and_return(saveSucceeds)
  Location.stub!(:new).and_return(@newLocation)
end