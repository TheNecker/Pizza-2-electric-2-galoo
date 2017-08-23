require 'sinatra'
enable :sessions

get '/' do
	erb :index
end 

post '/components' do 
	crust = params[:cchoices]	
	cheese = params[:chchoices]
	meats = params[:mchoices]
	veggies = params[:vchoices]
	redirect '/confirm'
end 

get '/confirm' do 
	erb :confirm, locals: {cchoices: :crust, chchoices: :cheese, mchoices: :meats, vchoices: :veggies}
end 

post '/confirm' do 
	session[:confirmchoices] = params[:confirmed_options]
	redirect '/finalresults'
end 

get '/finalresults' do 
	erb :final, locals: {finalchoices: session[:confirmchoices]}
end 
