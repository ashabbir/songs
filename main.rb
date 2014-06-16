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


#add new  C of crud
get '/songs/new' do
  @song = Song.new
  erb :song_new
end


post '/songs' do
  song = Song.create(params[:song])
  redirect to("/songs/#{song.id}")
end


#show list R of crud
get '/songs' do
  @songs = Song.all
  erb :songs
end

#show single R of crud
get '/songs/:id' do
  @song = Song.get(params[:id])
  erb :song_show
end


#Update single U of crud
get '/songs/:id/edit' do
  @song = Song.get(params[:id])
  erb :song_edit
end

put '/songs/:id' do
  song = Song.get(params[:id])
  song.update(params[:song])
  redirect to("/songs/#{song.id}")
end

#delete single D of crud
delete '/songs/:id' do
  @song = Song.get(params[:id]).destroy
  redirect to('/songs')
end



