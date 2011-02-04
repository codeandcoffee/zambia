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
  field :dayOfWeek
  field :time, :type => Time
  field :isApproved, :type => Boolean, :default => false
  
  validates_uniqueness_of :name
  validates_presence_of :name, :message => "is required."
end