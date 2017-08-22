require 'sinatra'
enable :sessions

get '/' do
	erb :index
end 

post '/components' do 
	session[:options] = params[:choices]
	redirect '/confirm'
	p "#{choices.join(",")}"
end 

get '/confirm' do 
	erb :confirm, locals: {choices: session[:options]}
end 

post '/confirm' do 
	session[:confirmchoices] = params[:confirmed_options]
	redirect '/finalresults'
end 

get '/finalresults' do 
	erb :final, locals: {finalchoices: session[:confirmchoices]}
end 
