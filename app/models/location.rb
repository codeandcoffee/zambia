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
  def goodAddress? 
    !street1.blank? && !city.blank?
  end

  def google_map_url
    "http://maps.google.com/maps?f=q&source=s_q&hl=en&geocode=&q=#{street1},+#{state},+#{postalCode}"
  end
end
