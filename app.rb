require 'sinatra'
require 'sinatra/activerecord'
require 'bundler/setup'
require './models'
set :database, "sqlite3:micro_blog.sqlite3"
enable :sessions

def current_user
    if session[:user_id]
    @current_user = User.find(session[:user_id])
    end
end

get '/' do
    #contains log in and signup options.
  erb :home
end

post '/sign-in' do
    @user = User.where(fname: params[:fname]).first
    if !@user.nil? && @user.password == params[:password]
    session[:user_id] = @user.id
    puts "*****************"
    puts session.inspect
    puts "*****************"
    redirect "/single_user/#{@user.id}"
    end
    redirect '/'
  end

get '/log_out' do
    session.clear
    redirect "/"
end

post '/single_user/new' do
    puts params
    @new_user = User.create(params[:new_user])
    redirect "/single_user/#{@new_user.id}"
end

get '/single_user/:id' do
    puts "*****************"
    puts session[:user_id]
     puts "*****************"
    @user = User.find(params[:id])
    @posts = @user.posts
    puts @posts
    erb :single_user
end

post '/single_user/edit/:id' do
    @update = params[:user]
    @user = User.find(params[:id])
    @user.update(@update)
    redirect "/single_user/#{@user.id}"
end

get '/single_user/delete/:id' do
    @user = User.find(params[:id])
    @user.destroy
    session.clear
    redirect "/"
    end

get '/all_users' do
  @users = User.all
    erb :all_users
end

get '/post' do
    @post = Post.find(params[:id])
    erb :post
end

get '/post/:id' do
    @post = Post.find(params[:id])
    puts "*****************"
    puts session[:user_id]
     puts "*****************"
    erb :post
end

post '/post/new' do
    @new_post = Post.new(params[:new_post])
    @new_post.user_id = current_user.id
    @new_post.save
    redirect "/post/#{@new_post.id}"
end

get '/posts' do
  @posts = Post.all
  erb :posts
end
