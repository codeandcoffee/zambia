# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
Location.create(:name => "Stauf's", :city => "Grandview", :state => "Ohio", :dayOfWeek => "Thursday", :time => "07:00", :isApproved => true)
Location.create(:name => "Polaris Panera", :city => "Delaware", :state => "Ohio", :dayOfWeek => "Monday", :time => "07:00", :isApproved => true)

Post.create(:body => "<p>We've been at this little shin-dig for over a year now, we've got a few locations going, and plenty of coders looking to sharpen their skills. So...
</p><p>Time to redo the Code and Coffee website! (This one here. The one with the canned CSS layout and the static first post hacked together in 4 hours running on Blogger.)
</p>")

User.create(:email => "shawn@wshawn.com", :password => "password")
User.create(:email => "tim@timwingfield.com", :password => "password")
