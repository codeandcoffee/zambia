require 'spec_helper'
require 'cancan/matchers'

describe LocationController do

  before (:each) do
    user = User.create!(:email => "test@emailaddress.com", :password => "password")
    session[:user_id] = user.id
  end
  
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
  
  context "when calling the edit action" do
    it "should render the edit template" do
      get :edit, :id => 'TEST LOCATION NAME'
      response.should render_template('edit')
    end
  end
  
  context "when calling the update action" do
    
    it "should redirect to index on successful save" do
      mockOutUpdateOnEditLocation(true)
      put :update, :id => "TEST LOCATION NAME"
      response.should redirect_to(:action => 'index')
    end
    
    it "should redirect to edit on failed save" do
      mockOutUpdateOnEditLocation(false)
      post :update, :id => "TEST LOCATION NAME"
      response.should render_template('edit')
    end
  end
  
end

def mockOutSaveOnNewLocation(saveSucceeds)
  @newLocation = Location.new()
  @newLocation.stub!(:save).and_return(saveSucceeds)
  Location.stub!(:new).and_return(@newLocation)
end

def mockOutUpdateOnEditLocation(updateSucceeds)
  @existingLocation = Location.new()
  @existingLocation.stub!(:update_attributes).and_return(updateSucceeds)
  Location.stub!(:find).and_return(@existingLocation)
end