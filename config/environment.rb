# Load the rails application
require File.expand_path('../application', __FILE__)

# set up the Rails logger
Rails.logger = Logger.new(STDOUT)

# Initialize the rails application
Brainbox::Application.initialize!
