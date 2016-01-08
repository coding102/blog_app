#create "Gemfile" file, add "gem 'sinatra'", and run bundle install
require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'
set :database, "sqlite3:myblogdb.sqlite3"
require './models'
enable :sessions
set :sessions, true





#homepage url
get '/' do
    erb :home
end





# sign in rules
post '/sign-in' do
    @user = User.where(username: params[:username]).first
    if @user.password == params[:password]
        redirect '/blog'
    else
        redirect '/'
    end
end





get '/settings' do
    erb :settings
end




#signup page if you are a new user
get '/signup' do
    erb :signup
end





#blog page, page you are directed to if you sign in succesfully
get '/blog' do
    erb :signedin
end

