
# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Compras::Application.initialize!

APP_VERSION = `git describe --tag --always` unless defined? APP_VERSION
