require( 'sinatra' )
require( 'sinatra/contrib/all' )
require('pry')
require_relative('../models/city')
require_relative('../models/country')
require_relative('../models/destination')
also_reload( '../models/*' )

get '/bucket_list_destinations/:id' do
  @city = Country.find(params['id'])
  @cities = @country.cities()
  @id = params['id']
  erb(:"destination/bucket_list_destination")
end

get '/bucket_list_cities/:id' do
  @country = Country.find(params['id'])
  @cities = @country.cities()
  @id = params['id']
    erb(:"city/bucket_list_cities_by_country")
  end
