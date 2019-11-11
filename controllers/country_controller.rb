require( 'sinatra' )
require( 'sinatra/contrib/all' )
require('pry')
require_relative('../models/city')
require_relative('../models/country')
also_reload( '../models/*' )


get '/home/new_country' do
  erb(:"country/new_country")
end
