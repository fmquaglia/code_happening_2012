DATABASE_NAME                 = "twitter_mongo"
COLLECTION_NAME               = "tweets"
TAGS                          = %w(12-21-2012 mayacalendar december212012 endoftheworld 2012endoftheworld worldends)
MY_TWITTER_CONSUMER_KEY       = 'XjFi0zpdwJDTC7KXxH0uw'
MY_TWITTER_CONSUMER_SECRET    = 'YncoEtzmysEGgAmQGFeWNvwWq5TLw5kfupm40MyMTyY'
MY_TWITTER_OAUTH_TOKEN        = '167979837-72hzqnwaOTHIRjT7I93rJXo26l3msTHoWBpwIo5c'
MY_TWITTER_OAUTH_TOKEN_SECRET = '1L7igjyxsCgRP0O3AsU0WZvlKxemzfK0sFlKYzNNCs'

ENV['LOVE_MONGO']="mongodb://twitter_admin:changeme@127.0.0.1:12863/#{DATABASE_NAME}"
