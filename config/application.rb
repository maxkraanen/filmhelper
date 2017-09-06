require_relative "../api.rb"


configure :development do
  require "better_errors"
  use BetterErrors::Middleware
  BetterErrors.application_root = __dir__
end

# Load all helpers!
Dir["#{__dir__}/../app/helpers/*.rb"].each {|file| require file }

# Load all services!
Dir["#{__dir__}/../app/services/*.rb"].each {|file| require file }


# Load all models!
Dir["#{__dir__}/../app/models/*.rb"].each {|file| require file }
