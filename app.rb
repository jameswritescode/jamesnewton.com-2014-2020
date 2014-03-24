require 'sinatra'
require 'oauth'
require 'yaml'
require 'httparty'

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

def get_last_two_instagram
  config = YAML.load_file('config.yml')

  data = HTTParty.get("https://api.instagram.com/v1/users/329461525/media/recent/?client_id=#{config['instagram']['client_id']}")['data'].first(2)

  data.map { |object| object['images']['standard_resolution']['url'] }
end

get '/' do
  erb :index
end
