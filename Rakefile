# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

## FOR TRAVIS CI START
require 'rspec/core/rake_taks'

task :default => :spec
RSpec::Core::RakeTask.new
## FOR TRAVIS CI END

Rails.application.load_tasks
