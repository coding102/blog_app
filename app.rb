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
get '/home' do
    erb :home
end

post '/signedin' do
	   @user = User.where(username: params[:username]).first
		  if @user.password == params[:password]
			     session[:user_id] = @user.id
			     current_user
        redirect '/signedin'
		  else
        redirect '/signup'
		  end
end


get '/signedin' do
    erb :signedin
end


get '/signup' do
    erb :signup
end





post '/sign_up' do
	   @user = User.where(username: params[:username]).first
	   if @user.nil?
		      @user = User.create(username: params[:username], password: params[:password], email: params[:email], zipcode: params[:zipcode])
		flash[:notice] = 'Congratulations! You have successfully signed up and edited your profile.'	
		@profile = Profile.create(fname: params[:fname], city: params[:city], birthday: params[:birthday], lname: params[:lname])
		@user.profile = @profile
		@user.save
		erb :edit_profile
	else
		flash[:alert] = 'The username: #{params[:username] has been taken'
		redirect '/sign_up_failed'
	end
		session[:user_id] = @user.id
		current_user
		erb :edit_profile
end














#
#
#get '/settings' do
#    erb :settings
#end
#
#
#
#
##signup page if you are a new user
#get '/signup' do
#    erb :signup
#end







