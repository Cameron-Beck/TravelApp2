require( 'sinatra' )
require( 'sinatra/contrib/all' )
require('pry')
require_relative('../models/city')
require_relative('../models/country')
also_reload( '../models/*' )

get '/home/new_city' do
  @countries = Country.all
  erb(:"city/new_city")
end

post '/home/new_city' do
  City.new(params).save
  redirect to '/home'
end
