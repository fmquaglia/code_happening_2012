load 'bootstrap.rb'
load 'twitter_mongo.rb'
CONFIG['twitter']['tags'].each do |tag|
  archive = TwitterMongo.new(tag)
  archive.update
end