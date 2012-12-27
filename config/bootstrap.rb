require "yaml"

config_file     = File.open 'config/config.yml'
config_load     = YAML::load config_file
ENV['RACK_ENV'] = 'development' unless defined? ENV['RACK_ENV']
CONFIG          = config_load[ENV['RACK_ENV']]

auth_options      = CONFIG['mongo']['auth'] == 'auth' ? "#{CONFIG['mongo']['user']}:#{CONFIG['mongo']['password']}@" : ""
ENV['MONGO_URI']  = "mongodb://#{auth_options}#{CONFIG['mongo']['host']}:#{CONFIG['mongo']['port']}/#{CONFIG['mongo']['database']}"

MY_TWITTER_CONSUMER_KEY       = CONFIG['twitter']['consumer_key']
MY_TWITTER_CONSUMER_SECRET    = CONFIG['twitter']['consumer_secret']
MY_TWITTER_OAUTH_TOKEN        = CONFIG['twitter']['oauth_token']
MY_TWITTER_OAUTH_TOKEN_SECRET = CONFIG['twitter']['oauth_token_secret']