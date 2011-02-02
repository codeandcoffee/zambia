desc "seed data"

task :seed => :environment do |task|

  Location.create(:name => "Stauf's Grandview", :isApproved => true)
  Location.create(:name => "Cup 'O Joe, German Village", :isApproved => true)
  Location.create(:name => "Polaris Panera", :isApproved => true)

end

desc "delete all data"

task :delete_data => :environment do |task|
  Location.delete_all
end
