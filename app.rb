require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/city_controller')
require_relative('controllers/country_controller')
also_reload( '../models/*' )

get '/home' do
  erb(:"country/home")
end
