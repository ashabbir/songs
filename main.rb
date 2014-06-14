require 'sinatra'
require 'sinatra/reloader' if development?
require './song'



set :public_folder, 'public'

not_found do
  erb :not_found
end


get '/' do
  erb :home
end

get '/about' do
  erb :about
end 

get '/contact' do 
  erb :contact
end


get '/songs' do
  @songs = Song.all
  erb :songs
end

