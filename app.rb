require 'sinatra'
require 'sinatra/activerecord'
require 'bundler/setup'
require './models'
set :database, "sqlite3:micro_blog.sqlite3"

get '/' do
    #contains log in and signup options.
  erb :home
end

post '/home' do

end

post '/users/new' do
  puts params
end
    
get '/profile' do 
  erb :profile
end

get '/profile/:id' do
    @user = User.find(params[:id])
    @posts = @user.posts
    erb :user
end
    
get '/users' do 
  users.all
end

get '/feed' do
    erb :feed
end
