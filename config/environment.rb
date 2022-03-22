# Load the Rails application.
require_relative 'application'

# load environment variable

Dotenv.load(
  File.join("#{Rails.root}/config", '.env.local'),
  File.join("#{Rails.root}/config", '.env')
)

# Initialize the Rails application.
Rails.application.initialize!
