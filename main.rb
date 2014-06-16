require 'sinatra'
require 'sinatra/reloader' if development?
require './song'
require 'json'
require 'pry' if development?
require 'pony'



set :static, true
set :root, File.dirname(__FILE__)
set :public, 'public'


configure :development do
  DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/development.db")
end
configure :production do
  DataMapper.setup(:default, ENV['DATABASE_URL'])
end

configure do
  enable :sessions
  set :username, 'frank'
  set :password, 'sinatra'
end


not_found do
  erb :not_found
end

error do
  @error = request.env['sinatra_error'].name
  haml :'500'
end


# login 
get '/' do
  erb :login, :layout => false
end

post '/login' do
  content_type :json
  if params[:username] == settings.username && params[:password] == settings.password
    session[:admin] = true
    { :login => 'success'}.to_json
  else
    { :login => 'fail'}.to_json
  end
end

get '/logout' do
  session.clear
  redirect to('/')
end




# basic gets for home contact and about
get '/home' do
  erb :home
end

get '/about' do
  erb :about
end 

get '/contact' do 
  erb :contact
end


post '/contact' do
  send_message
  redirect to('/home')
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



def send_message
  Pony.mail(
  :from => params[:name] + '<' + params[:email] + '>',
  :to => 'shabbir10314@gmail.com',
  :subject => params[:name] + " has contacted you",
  :body =>params[:message],
  :via => :smtp,
  :via_options => {
    :address              => 'smtp.gmail.com',
    :port                 => '587',
    :enable_starttls_auto => true,
    :user_name            => ENV['USR_NAME'],
    :password             => ENV['PWD'],
    :authentication       => :plain, 
    :domain               => "heroku.com" 
    })
end


