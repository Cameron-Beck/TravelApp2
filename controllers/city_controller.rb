require( 'sinatra' )
require( 'sinatra/contrib/all' )
require('pry')
require_relative('../models/city')
require_relative('../models/country')
require_relative('../models/destination')
also_reload( '../models/*' )

get '/home/new_city' do
  @countries = Country.all
  erb(:"city/new_city")
end

post '/home/new_city' do
  City.new(params).save
  redirect to '/home/all_cities'
end

get '/home/all_cities' do
  @city = City.all
  erb(:"city/all_cities")
end

# get '/home/cities_by_country' do
#   @city = City.find(params['id'])
#   @cities = @city.cities_by_country()
#   @id = params['id']
#   erb(:"city/cities_by_country")
# end

post '/home/:id/delete_city' do
  city = City.find(params['id'])
  city.delete
  redirect back
end

get '/home/:id/edit_city' do
  @city = City.find(params['id'])
  erb(:"city/edit_city")
end

post '/home/:id/edit_city' do
  city = City.new(params)
  city.update
  redirect to "home/all_cities"
end

get '/home/bucket_list_cities' do
  @city = City.all_bucket_list
  erb(:"city/bucket_list_cities")
end

get '/home/cities_visited' do
  @city = City.all_cities_visited
  erb(:"city/visited_cities")
end
