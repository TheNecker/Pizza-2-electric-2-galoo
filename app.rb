require 'sinatra'
enable :sessions

get '/' do
	erb :index
end 

post '/components' do 
	session[:cchoices] = params[:crust]	
	session[:chchoices] = params[:cheese]
	session[:mchoices] = params[:meats]
	session[:vchoices] = params[:veggies]
	puts "MADE IT TO POST COMPONENTS #{session[:cchoices]}"
	puts "MADE IT TO POST COMPONENTS #{session[:chchoices]}"
	puts "MADE IT TO POST COMPONENTS #{session[:mchoices]}"
	puts "MADE IT TO POST COMPONENTS #{session[:vchoices]}"
	redirect '/confirm'
end 

get '/confirm' do 
	erb :confirm, locals: {crust: session[:cchoices], cheese: session[:chchoices], meats: session[:mchoices], veggies: session[:vchoices]}
end 

post '/confirm' do 
	session[:confirmchoices] = params[:confirmed_options]
	redirect '/finalresults'
end 

get '/finalresults' do 
	erb :final, locals: {finalchoices: session[:confirmchoices]}
end 
