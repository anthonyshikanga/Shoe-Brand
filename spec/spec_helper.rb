ENV['RACK_ENV'] = 'test'
  require("bundler/setup")
  Bundler.require(:default, :test)
  set(:root, Dir.pwd())

  require('capybara/rspec')
  Capybara.app = Sinatra::Application
  set(:show_exceptions, false)
  require('./app')

  #This allows gems in the :test group to be loaded by spec_helper rather than the main program
  #Used Ruby's Dir class to set the root directory to Dir.pwd() which is the starting point for finding all files expected
  #Also all Integration testing files are removed from the individual Integration testing files to spec_helper to load it one time
  
