require 'sinatra'
require 'sinatra/activerecord'
require 'bundler/setup'
require './models'
set :database, "sqlite3:micro_blog.sqlite3"

get '/' do
    #contains log in and signup options.
  erb :home
end

post '/single_user/new' do
  puts params
    @new_user = User.create(params[:new_user])
    redirect "/single_user/#{@new_user.id}"
    
end

get '/all_users' do 
  @users = User.all
    erb :all_users
end

get '/single_user/:id' do
    @user = User.find(params[:id])
    @posts = @user.posts
    erb :single_user
end
    

get '/post' do
    erb :post
end

get '/post/:id' do
    @post = Post.find(params[:id])
    erb :post
end

post '/sign-in' do
     @user = User.where(fname: params[:fname]).first
  if @user.password == params[:password]
    session[:user_id] = @user.id
    redirect "/single_user/#{@user.id}"
  else
    redirect '/sign_in_failed'
  end
end 

get '/log_out' do
     
    session.clear
    redirect "/"
 
end 

get '/single_user/delete/:id' do
    @user = User.find(params[:id])
    @user.destroy
    session.clear
    redirect "/"
    end 

post '/post/new' do
    @new_post = Post.create(params[:new_post])
    redirect "/post/#{@new_post.id}"
end

