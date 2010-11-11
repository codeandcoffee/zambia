class Location
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  field :street1
  field :street2
  field :city
  field :state
  field :postalCode
  field :hashtag
  
  validates_presence_of :name, :message => "Location name is required."
end