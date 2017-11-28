require( 'sinatra' )
require( 'sinatra/reloader' )
require( 'pry-byebug' )

require_relative('./models/owner')
require_relative('./models/animal')

#index see all animals
get '/' do
  @animals = Animal.all
  erb ( :index )
end

# to see details of an individual animals
get '/animal/:id' do
  @animal = Animal.find(params[:id])
  erb ( :show )
end

# to update animals
get '/animal/:id/edit' do
  @animal = Animal.find(params[:id])
  @owners = Owner.all
  erb ( :edit )
end

put '/animals/:id' do # update
  Animal.new( params ).update
  redirect to '/'
end

get '/owners' do
  @owners = Owner.all
  @animals = Animal.all
  erb( :owners )
end

get '/adopt-me/:id' do
  @animal = Animal.find(params[:id])
  @owners = Owner.all
  erb ( :adopt )
end

put '/adopt-me/:id/adopt' do
  animal = Animal.find(params[:id])
  animal.adopt(params[:owner_id])
  redirect to '/'
end
