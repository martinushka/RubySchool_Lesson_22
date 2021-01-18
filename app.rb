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
		return erb :visit
	end

	if @phone == ''
		@error = 'Введите телефон'
		return erb :visit
	end

	if @datetime == ''
		@error = 'Введите время'
		return erb :visit
	end
	if @barber == ''
		@error = 'Введите имя парикхмахера'
		return erb :visit
	end
	if @color == ''
		@error = 'Введите цвет'
		return erb :visit
	end


	erb "OK, #{@username}, #{@phone}, #{@datetime}, #{@barber}"
end