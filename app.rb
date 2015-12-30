#create "Gemfile" file, add "gem 'sinatra'", and run bundle install
require 'sinatra'


get '/' do
    erb :home
end