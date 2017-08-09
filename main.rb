require "sinatra"
require "csv"
require "pry"
require_relative "functions.rb"



get '/' do 
	erb :index
end

post '/' do
	  params.to_s

 erb :index
end

=begin
get '/full' do
	showReport
	erb :full
end

get '/Sonia' do
	showReport
	erb :Sonia
end


get '/Priya' do
	showReport
	erb :Priya
end

=end


