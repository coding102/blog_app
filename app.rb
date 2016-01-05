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
        redirect '/blog'
    else
        redirect '/'
    end
end





get '/settings' do
    erb :settings
end



#get '/registration' do
#	erb :registration, :layout => nil
#end
#
#post '/settings' do
#		#this creates the profile in database
#		@profile = Profile.create(bio: params[:bio], picture: params[:picture], bg_color: params[:bg_color], text_color: params[:text_color], user_id: session[:user_id])
#		erb :userpage
#
#end
#
#	#this is the registration page where they enter their details
#	#this should be passed through to the current_user
#post '/registration' do
#
#	@user = User.create(email: params[:email], password: params[:password], name: params[:name], city: params[:city])
#	@user.profile = Profile.create(name: params[:name], city: params[:city])
#		erb :home
#	redirect '/'
#end	





#signup page if you are a new user
get '/signup' do
    erb :signup
end





#blog page, page you are directed to if you sign in succesfully
get '/blog' do
    erb :signedin
end

