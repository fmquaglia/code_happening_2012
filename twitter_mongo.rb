require 'rubygems'
require 'twitter'

class TwitterMongo
  def initialize(tag)
    setup_twitter
    connection = Mongo::Connection.from_uri ENV['MONGO_URI']
    db         = connection[CONFIG['mongo']['database']]
    @tweets    = db[CONFIG['mongo']['collection']]

    @tweets.create_index([['id', 1]], :unique => true)
    @tweets.create_index([['tags', 1], ['id', -1]])

    @tag          = tag
    @tweets_found = 0
  end

  def update
    puts "Starting Twitter search for '#{@tag}'..."
    save_tweets_for(@tag)
    print "#{@tweets_found} tweets saved.\n\n"
  end

  private

    def save_tweets_for(term)
      Twitter.search(term).statuses.each do |tweet|
        @tweets_found  += 1
        tweet_with_tag = tweet.to_hash.merge!({"tags" => [term]})
        @tweets.save(tweet_with_tag)
      end
    end

    def setup_twitter
      Twitter.configure do |config|
        config.consumer_key       = MY_TWITTER_CONSUMER_KEY
        config.consumer_secret    = MY_TWITTER_CONSUMER_SECRET
        config.oauth_token        = MY_TWITTER_OAUTH_TOKEN
        config.oauth_token_secret = MY_TWITTER_OAUTH_TOKEN_SECRET
      end
    end

end