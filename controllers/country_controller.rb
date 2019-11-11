require( 'sinatra' )
require( 'sinatra/contrib/all' )
require('pry')
require_relative('../models/city')
require_relative('../models/country')
also_reload( '../models/*' )


get '/home/new_country' do
  erb(:"country/new_country")
end

post '/home/new_country' do
  Country.new(params).save
  redirect to '/home'
end

get '/home/all' do
  @country = Country.all
  erb(:"country/all_countries")
end
