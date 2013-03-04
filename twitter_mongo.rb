require 'rubygems'
require 'twitter'

class TwitterMongo

  def initialize(tag)
    setup_twitter
    setup_tweets
    @tag = tag
    @count = 0
  end

  def update
    prepare
    search(@tag).each {|tweet| save(tweet, @tag) }
    report
  end

  private

  def prepare
    puts "Starting Twitter search for '#{@tag}'..."
  end

  def report
    puts "#{@count} tweets saved."
    puts
  end

  def connection
    Mongo::Connection.from_uri(ENV['MONGO_URI'])
  end

  def db
    connection[CONFIG['mongo']['database']]
  end

  def save(tweet, term)
    @tweets.save(tweet.to_hash.merge!("tags" => [term]))
    @count += 1
  end

  def search(term)
    Twitter.search(term).statuses
  end

  def setup_twitter
    Twitter.configure do |config|
      config.consumer_key       = MY_TWITTER_CONSUMER_KEY
      config.consumer_secret    = MY_TWITTER_CONSUMER_SECRET
      config.oauth_token        = MY_TWITTER_OAUTH_TOKEN
      config.oauth_token_secret = MY_TWITTER_OAUTH_TOKEN_SECRET
    end
  end

  def setup_tweets
    @tweets = db[CONFIG['mongo']['collection']]
    @tweets.create_index([['id', 1]], :unique => true)
    @tweets.create_index([['tags', 1], ['id', -1]])
  end

end