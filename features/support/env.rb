require "capybara/cucumber"
require_relative "../../lib/application"

Capybara.app = Application

Before do
  Track.delete_all
end
