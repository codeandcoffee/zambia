# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
Location.create(:name => "Stauf's", :city => "Grandview", :state => "Ohio", :dayOfWeek => "Thursday", :time => "07:00", :isApproved => true)
Location.create(:name => "Cup 'O Joe, German Village", :city => "Columbus", :state => "Ohio", :dayOfWeek => "Thursday", :time => "07:00", :isApproved => true)
Location.create(:name => "Polaris Panera", :city => "Delaware", :state => "Ohio", :dayOfWeek => "Monday", :time => "07:00", :isApproved => true)