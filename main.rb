require 'sinatra'
require 'sinatra/reloader' if development?


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

