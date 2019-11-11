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
  redirect to 'country/all_countries'
end

get '/home/all_countries' do
  @country = Country.all
  erb(:"country/all_countries")
end

post '/home/:id/delete_country' do
  country = Country.find(params['id'])
  country.delete
  redirect back
end

get '/home/:id/edit_country' do
  @country = Country.find(params['id'])
  erb(:"country/edit_country")
end

post '/home/:id/edit_country' do
  country = Country.new(params)
  country.update
  redirect to "home/all_countries"
end

get '/home/bucket_list_countries' do
  @country = Country.all_bucket_list
  erb(:"country/bucket_list_countries")
end

get '/home/visited_countries' do
  @country = Country.all_countries_visited
  erb(:"country/visited_countries")
end

get '/bucket_list_cities/:id' do
  @country = Country.find(params['id'])
  @cities = @country.cities()
  @id = params['id']
  erb(:"city/bucket_list_cities_by_country")
end

get '/visited_cities/:id' do
  @country = Country.find(params['id'])
  @cities = @country.cities()
  @id = params['id']
  erb(:"city/visited_cities_by_country")
end
