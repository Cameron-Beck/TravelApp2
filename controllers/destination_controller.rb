require( 'sinatra' )
require( 'sinatra/contrib/all' )
require('pry')
require_relative('../models/city')
require_relative('../models/country')
require_relative('../models/destination')
also_reload( '../models/*' )

get '/home/all_destinations' do
  @destination = Destination.all
  erb(:"destination/all_destinations")
end
