require 'sinatra'
require 'sinatra/activerecord'
require 'bundler/setup'



set :database, "sqlite3:micro_blog.sqlite3"

get '/' do
  erb :home
end

get '/profile' do 
  erb :profile
end
