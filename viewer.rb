require "rubygems"

require 'compass'
require "sinatra"
require 'haml'
require 'sass'


configure do
  require_relative "config"
  require           "mongo"
  require_relative "twitter_mongo"

  connection = Mongo::Connection.from_uri ENV['MONGO_URI']
  DATABASE = connection[DATABASE_NAME]
  TWEETS    = DATABASE[COLLECTION_NAME]

  Compass.configuration do |config|
    config.project_path = File.dirname(__FILE__)
    config.sass_dir = 'views/stylesheets'
  end

  set :haml, { :format => :html5, :escape_html => true }
  set :scss, {:style => :compact, :debug_info => false}
end

get '/' do
  selector = params['tag'] ? {:tags => params['tag']} : {}
  @tweets = TWEETS.find(selector).sort(["id", -1])
  haml :tweets
end

get '/clean' do
  DATABASE.drop_collection COLLECTION_NAME
  redirect '/'
end

get '/update' do
  TAGS.each do |tag|
    archive = TwitterMongo.new(tag)
    archive.update
  end
  redirect '/'
end

get '/stylesheets/:name.css' do
  content_type 'text/css', :charset => 'utf-8'
  scss(:"stylesheets/#{params[:name]}", Compass.sass_engine_options)
end

