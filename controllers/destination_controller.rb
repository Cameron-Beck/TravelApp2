require( 'sinatra' )
require( 'sinatra/contrib/all' )
require('pry')
require_relative('../models/city')
require_relative('../models/country')
require_relative('../models/destination')
also_reload( '../models/*' )

# get '/bucket_list_destinations/:id' do
#   @city = City.find(params['id'])
#   @destinations = @city.destinations()
#   @id = params['id']
#   erb(:"destination/bucket_list_destination")
# end
