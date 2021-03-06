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
	session[:carchoices] = params[:carry]
	session[:achoices] = params[:address]
	session[:schoices] = params[:sauce]
	session[:sichoices] = params[:size]
	puts "MADE IT TO POST COMPONENTS #{session[:cchoices]}"
	puts "MADE IT TO POST COMPONENTS #{session[:chchoices]}"
	puts "MADE IT TO POST COMPONENTS #{session[:mchoices]}"
	puts "MADE IT TO POST COMPONENTS #{session[:vchoices]}"
	puts "MADE IT TO POST COMPONENTS #{session[:carchoices]}"
	puts "MADE IT TO POST COMPONENTS #{session[:achoices]}"
	puts "MADE IT TO POST COMPONENTS #{session[:schoices]}"
	puts "MADE IT TO POST COMPONENTS #{session[:sichoices]}"
	redirect '/confirm'
end 

get '/confirm' do 	
	erb :confirm, locals: {crust: session[:cchoices], cheese: session[:chchoices], meats: session[:mchoices], veggies: session[:vchoices], address: session[:achoices], size: session[:sichoices], sauce: session[:schoices]}
end 

post '/confirm' do 
  session[:confirmed] = params[:confirmed]	
  session[:total] = params[:value]
  redirect '/final'	
end 

get '/final' do 
	erb :final, locals: {confirmed: session[:confirmed],crust: session[:cchoices], cheese: session[:chchoices], meats: session[:mchoices], veggies: session[:vchoices], address: session[:achoices], size: session[:sichoices], sauce: session[:schoices], value: session[:total]}
end 
