#create "Gemfile" file, add "gem 'sinatra'", and run bundle install
require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'

set :database, "sqlite3:myblogdb.sqlite3"
require './models'
enable :sessions
set :sessions, true





#set session
def current_user
	   if session[:user_id]
		      @current_user = User.find(session[:user_id])
	   end
end



#recent 10 posts
#get '/' do
#	   @posts = Post.order(id: :desc).take(10)
#	   erb :home
#end



# sign in rules
get '/' do
    erb :home
end

post '/signedin' do
	   @user = User.where(username: params[:username]).first
    if @user && @user.password == params[:password]
			     session[:user_id] = @user.id
			     current_user
        redirect '/signedin'
		  else
        flash[:alert] = "username and/or password is incorrect"
        redirect '/signup'
		  end
end

get '/signedin' do
    erb :signedin
end



get '/signup' do
    erb :signup
end

post '/signup' do
    User.create(params[:user])
    redirect '/'
end














