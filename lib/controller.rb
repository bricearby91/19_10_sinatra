require 'gossip'

class ApplicationController < Sinatra::Base

get '/' do
  erb :index, locals: {gossips: Gossip.all}
end

get '/gossips/new/' do
	erb :new_gossip
end

post '/gossips/new/' do
	Gossip.new(params["gossip_author"],params["gossip_content"]).save
	redirect '/'
end

get '/gossips/:id' do
	erb :show, locals: {nb: params['id'].to_i }
end

get '/gossips/:id/edit' do
	erb :edit, locals: {nb: params['id'].to_i }
end

post '/gossips/:id/edit' do
	CSV.open("./db/gossip.csv","wb").each do |csv|
				csv[1] = "C'est faux !"
		end
	redirect '/'
end
end
