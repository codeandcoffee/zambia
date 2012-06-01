class Location
  def all    
    raw_yaml_data.to_a.map do |loc|
      loc[1].merge({'id' => loc.first})
    end
  end

  def set_up_today_and_tomorrow
    locs = all

    locs = forget_about_today_and_tomorrow(locs)
    locs = mark_today_in_locations(locs)
    locs = mark_tomorrow_in_locations(locs)

    locs
  end
  
  def filename
    if Rails.env.production?
      "locations.yml"
    else
      "locations_development.yml"
    end
  end  

  def raw_yaml_data
    @raw_yaml_data ||= YAML::load( File.open( File.join(Rails.root, filename) ) )
  end

  private
  
  def forget_about_today_and_tomorrow(locations)
    locations.each do |loc|
      loc['isToday'] = false if loc['isToday']
      loc['isTomorrow'] = false if loc['isTomorrow']
    end
  end

  def mark_today_in_locations(locations)
    todays_locs = locations.select { |loc| Chronic.parse(loc['day']).wday == Time.now.wday }
    todays_locs.each { |loc| loc['isToday'] = true }    
    locations
  end

  def mark_tomorrow_in_locations(locations)
    tomorrows_locs = locations.select { |loc| Chronic.parse(loc['day']).wday == Time.now.tomorrow.wday }
    tomorrows_locs.each { |loc| loc['isTomorrow'] = true }
    locations
  end
end
