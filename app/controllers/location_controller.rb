class LocationController < ApplicationController
  
  authorize_resource
  
  #GET /location
  def index
    @locations = Location.all.asc(:name)
  end
  
  # GET /location/name
  def show
    redirect_to :action => "index"
  end
  
  #GET /location/new
  def new
    @location = Location.new
  end
  
  #GET /location/edit
  def edit
    @location = Location.find(params[:id])
  end
  
  #POST /location/create
  def create
    @location = Location.new(params[:location])
    
    if (@location.save)
      redirect_to :action => "index"
    else
      render "new"
    end
  end
  
  #PUT /location/update
  def update
    @location = Location.find(params[:id])
    
    if (@location.update_attributes(params[:location]))
      redirect_to :action => "index"
    else
      render "edit"
    end
  end
  
  #GET /location/list
  def list
    @locations = Location.find(:all, :conditions => { :isApproved => true })
    render :partial => "list", :layout => false
  end
  
end
