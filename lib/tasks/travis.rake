task :travis do
  # borrowed from steveklabnik https://github.com/travis-ci/travis-ci/issues/272
  
  driver_file = "chromedriver_linux32_19.0.1068.0.zip"
  puts "Grabbing chromedriver..."
  mkdir_p "/tmp/bin"
  system "cd /tmp/bin && wget http://chromedriver.googlecode.com/files/#{driver_file} && unzip #{driver_file}"

  puts "Starting to run tests..."
  system("export PATH=/tmp/bin:$PATH && export DISPLAY=:99.0 && bundle exec rake")
  raise "`rake test` failed!" unless $?.exitstatus == 0
end

