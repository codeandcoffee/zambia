class Location
  def self.data
    @data ||= YAML::load( File.open( "#{Rails.root}/locations_development.yml" ) )
  end
end
