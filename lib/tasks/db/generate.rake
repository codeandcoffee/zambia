 namespace :db do
   desc 'Create initial roles and databases for Zambia'
   task :generate do
     puts "Creating Zambia roles and databases"
     system("psql -c \"create role postgres with createdb login;\" template1")
     system("psql -c \"create role zambia with createdb login;\" template1")
     system("psql -c \"create database zambia_development owner postgres;\" template1")
     system("psql -c \"create database zambia_test owner postgres;\" template1")
     system("psql -c \"create database zambia owner zambia;\" template1")
   end

   desc 'Create initial roles and databases for Zambia'
   task :destroy do
     puts "Dropping Zambia roles and databases"
     system("psql -c \"drop database zambia;\" template1")
     system("psql -c \"drop database zambia_test;\" template1")
     system("psql -c \"drop database zambia_development;\" template1")
     system("psql -c \"drop role zambia;\" template1")
     system("psql -c \"drop role postgres;\" template1")
   end
 end
