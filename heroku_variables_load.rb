#load
require 'open-uri'
require 'json'
HEROKU_API_KEY_BASE64_ENCODED = File.open('HEROKU_API_KEY_BASE64_ENCODED','r').read.chomp
HEROKU_APP_NAME = File.open('HEROKU_APP_NAME','r').read.chomp

text = open(
            "https://api.heroku.com/apps/#{HEROKU_APP_NAME}/config-vars",
            'Accept' => 'application/vnd.heroku+json; version=3',
            'Authorization' => HEROKU_API_KEY_BASE64_ENCODED,
           ).read

remote_envs = JSON.parse(text)
ENV.update(remote_envs)
