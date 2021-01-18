#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/About' do
	@error = 'something wrong'
	erb :about
end

get '/Visit' do
	erb :visit
end 

post '/visit' do
	
	@username = params[:username]
	@phone    = params[:phone]
	@datetime = params[:datetime]
	@barber   = params[:barber]
	@color    = params[:color]

	if @username == ''
		@error = 'Введите имя'
	end

	if @phone == ''
		@error = 'Введите телефон'
	end

	if @datetime == ''
		@error = 'Введите дату и время'
	end
	if @barber == ''
		@error = 'Введите имя парикхмахера'
	end
	if @color == ''
		@error = 'Введите цвет'
	end

	if @error != ''
		return erb :visit
	end


	erb "OK, #{@username}, #{@phone}, #{@datetime}, #{@barber}"
end