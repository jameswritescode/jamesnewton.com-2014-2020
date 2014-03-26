require 'sinatra'
require 'oauth'
require 'yaml'
require 'httparty'
require 'redcarpet'

def get_last_tweet
  config = YAML.load_file('config.yml')

  consumer = OAuth::Consumer.new(config['twitter']['api_key'], config['twitter']['api_secret'], {
    site:   'http://api.twitter.com',
    scheme: :header
  })

  access_token = OAuth::AccessToken.from_hash(consumer, {
    oauth_token: config['twitter']['access_token'],
    oauth_token_secret: config['twitter']['access_token_secret']
  })

  request = access_token.request(:get, "https://api.twitter.com/1.1/statuses/user_timeline/jameswritescode.json?count=1").body

  return JSON.parse(request).first
end

def get_last_post
  HTTParty.get('http://blog.jamesnewton.com/posts.json').first
end

get '/' do
  erb :index
end
