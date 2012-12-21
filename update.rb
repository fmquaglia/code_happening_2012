load 'config.rb'
load 'twitter_mongo.rb'
TAGS.each do |tag|
  archive = TwitterMongo.new(tag)
  archive.update
end