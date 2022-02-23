# Load the Rails application.
require_relative "application"

#load react_set.rb
app_test = File.join(Rails.root, 'config', 'react_set.rb')
load(app_test) if File.exist?(app_test)



# Initialize the Rails application.
Rails.application.initialize!
