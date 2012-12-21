# this rackup file is used to run the application
# when run via the Thin rack interace

require 'rubygems'
require 'sinatra'

# then load and run the application
load 'viewer.rb'
run Sinatra::Application