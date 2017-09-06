require 'open-uri'
require 'sinatra'
require "sinatra/reloader"
require_relative "config/application"
require 'pry'
require 'timezone'




get '/' do
  erb :index
end

get '/aperture' do
  @weather = Weather.new(city: params[:city], film_speed: params[:"film-speed"]) || Weather.new


  erb :aperture
end

get '/reciprocity_failure' do
  @reciprocity = Reciprocity.new(filmtype: params[:filmtype], time: params[:time].to_i)
  erb :reciprocity_failure
end

