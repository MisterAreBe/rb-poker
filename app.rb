require 'sinatra'
require_relative 'poker.rb'

enable :sessions

get '/' do
  erb :index, :layout => :layout, locals: {}
end

post '/load' do
  
  redirect '/'
end