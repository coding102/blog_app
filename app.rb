#create "Gemfile" file, add "gem 'sinatra'", and run bundle install
require 'sinatra'
require 'sinatra/activerecord'
set :database, "sqlite3:myblogdb.sqlite3"
require './models'



get '/' do
    erb :home
end

