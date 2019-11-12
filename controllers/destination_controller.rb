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

get '/home/new_destination' do
  @cities = City.all
  erb(:"destination/new_destination")
end

post '/home/new_destination' do
  Destination.new(params).save
  redirect to '/home/all_destinations'
end

post '/home/:id/delete_destination' do
  destination = Destination.find(params['id'])
  destination.delete
  redirect back
end

get '/home/:id/edit_destination' do
  @destination = Destination.find(params['id'])
  erb(:"destination/edit_destination")
end

post '/home/:id/edit_destination' do
  destination = Destination.new(params)
  destination.update
  redirect to "home/all_destinations"
end
