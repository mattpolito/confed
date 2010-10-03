# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
ConferenceEducation::Application.initialize!

# Load lib classes
require Rails.root.join('lib', 'speaker_rate')
