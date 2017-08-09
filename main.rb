require "sinatra"
require "csv"
require "pry"
require_relative "functions.rb"

get '/full' do
	showReport
	erb :full
end


get '/' do
	erb :index
end

get '/Sonia' do
	showReport
	erb :Sonia
end







