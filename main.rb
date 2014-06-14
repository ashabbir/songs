require 'sinatra'
require 'sinatra/reloader' if development?
require './song'



set :static, true
set :root, File.dirname(__FILE__)
set :public, 'public'

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


get '/songs/:id' do
  @song = Song.get(params[:id])
  erb :song_show
end

