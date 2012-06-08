require 'spec_helper'

describe Location do
  describe "syntax check: location.yml" do
    Given { subject.stub!(:filename => "locations.yml") }
    When(:yaml) { subject.raw_yaml_data }
    Then { yaml.count.should > 0 }
  end
  
  describe "syntax check: location_development.yml" do
    When(:yaml) { subject.raw_yaml_data }
    Then { yaml.count.should > 0 }
  end

  describe "#all" do
    context "first" do
      When(:location) { subject.all.first }
      Then { location['id'].should         == "cbus-staufs" }
      Then { location['city'].should       == "Columbus" }
      Then { location['coffeeshop'].should == "Stauf's" }
      Then { location['time'].should       == "7:00" }
    end

    context "second" do
      When(:location) { subject.all[1] }
      Then { location['id'].should   == "chi-sbux" }
      Then { location['city'].should == "Chicago" }
    end
  end

  describe "#set_up_today_and_tomorrow" do
    context "one location is happening today" do
      When(:todays_locations) { subject.set_up_today_and_tomorrow.select { |loc| loc['isToday']  } }
      Then { todays_locations.count.should == 1 }
      Then { Chronic.parse(todays_locations.first['day']).wday.should == Time.now.wday }
    end

    context "all locations are happening today" do
      Given do 
        locs = subject.all
        locs.each { |loc| loc['day'] = Time.now.strftime( '%A' ) }
        subject.stub!(:all => locs)
      end
      When(:todays_locations) { subject.set_up_today_and_tomorrow.select { |loc| loc['isToday']  } }
      Then { todays_locations.count.should >= 7 }
    end

    context "one location is happening tomorrow" do
      When(:tomorrows_locations) { subject.set_up_today_and_tomorrow.select { |loc| loc['isTomorrow']  } }
      Then { tomorrows_locations.count.should == 1 }
      Then { Chronic.parse(tomorrows_locations.first['day']).wday.should == (Time.now.tomorrow).wday }
    end

    context "all locations are happening tomorrow" do
      Given do 
        locs = subject.all
        locs.each { |loc| loc['day'] = Time.now.tomorrow.strftime( '%A' ) }
        subject.stub!(:all => locs)
      end
      When(:tomorrows_locations) { subject.set_up_today_and_tomorrow.select { |loc| loc['isTomorrow']  } }
      Then { tomorrows_locations.count.should >= 7 }
    end

    context "prior today's and tomorrows get erased" do
      Given do 
        locs = subject.all
        locs.each do |loc| 
          loc['isToday'] = true
          loc['isTomorrow'] = true
        end
        subject.stub!(:all => locs)
      end

      context "forget the past, one location is happening today" do
        When(:todays_locations) { subject.set_up_today_and_tomorrow.select { |loc| loc['isToday']  } }
        Then { todays_locations.count.should == 1 }
      end

      context "forget the past, one location is happening tomorrow" do
        When(:tomorrows_locations) { subject.set_up_today_and_tomorrow.select { |loc| loc['isTomorrow']  } }
        Then { tomorrows_locations.count.should == 1 }
      end
    end
  end

  describe "#wday" do
    When(:wday) { subject.wday(location)  }
    context "Thursday" do
      When(:location) { subject.all[0] }
      Then { wday.should == 4 }
    end
    context "Saturday" do
      When(:location) { subject.all[4] }
      Then { wday.should == 3 }
    end
    context "We really love the moon" do
      When(:location) { subject.all[7] } 
      Then { wday.should == nil }
    end
  end

  describe "#sort" do
    When(:sorted) { subject.sort }
    Then { sorted[0]['id'].should == "ak" }
    Then { sorted[6]['id'].should == "hs" }
    Then { sorted[7]['id'].should == "moon" }
  end

  describe "#locations_filename" do
    When(:filename) { subject.filename }
    Then { filename.should == "locations_development.yml" }
  end
end
