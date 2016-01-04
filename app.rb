#create "Gemfile" file, add "gem 'sinatra'", and run bundle install
require 'sinatra'
require 'sinatra/activerecord'

enable :sessions

set :database, "sqlite3:myblogdb.sqlite3"

require './models'



get '/' do
    erb :home
end


get '/signup' do
    erb :signup
end


get '/blog' do
    erb :signedin
end


get '/myaccount' do
    erb :myaccount
end

