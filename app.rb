#create "Gemfile" file, add "gem 'sinatra'", and run bundle install
require 'sinatra'
require 'sinatra/activerecord'
set :database, "sqlite3:myblogdb.sqlite3"
require './models'
enable :sessions





#homepage url
get '/' do
    erb :home
end





# sign in rules
post '/sign-in' do
    @user = User.where(username: params[:username]).first
    if @user.password == params[:password]
#send to personal blog page if both inputs match someone in database
        redirect '/blog'
    else
#send to home page if user is not in the database
        redirect '/'
    end
end





#signup page if you are a new user
get '/signup' do
    erb :signup
end





#blog page, page you are directed to if you sign in succesfully
get '/blog' do
    erb :signedin
end





#your account profile if you need to edit it
get '/settings' do
    erb :myacccount
end