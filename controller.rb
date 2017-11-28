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

#get form to create new animal
get '/animal/new' do
  @animals = Animal.all
  erb ( :new )
end

# create new animal
post '/animal' do
  @animal = Animal.new(params)
  @animal.save
  redirect to '/'
end

# to see details of an individual animals
get '/animal/:id' do
  @animal = Animal.find(params[:id])
  erb ( :show )
end

# get form to update animal
get '/animal/:id/edit' do
  @animal = Animal.find(params[:id])
  @owners = Owner.all
  erb ( :edit )
end

# update animal
put '/animals/:id' do
  Animal.new( params ).update
  redirect to '/'
end

#see all owners and adopted animals
get '/owners' do
  @table = Owner.animals
  @owners = Owner.all
  @animals = Animal.all
  erb( :owners )
end

#get form to create new owner
get '/owners/new' do
  @owners = Owner.all
  erb ( :new_owner )
end

# create new owner
post '/owners' do
  @owners = Owner.new(params)
  @owners.save
  redirect to '/owners'
end

# get form to update owner
get '/owners/:id/edit' do
  @owners = Owner.find(params[:id])
  erb ( :edit_owner )
end

# update owner
put '/owners/:id' do
  Owner.new( params ).update
  redirect to '/owners'
end

# get form to adopt an animal
get '/adopt-me/:id' do
  @animal = Animal.find(params[:id])
  @owners = Owner.all
  erb ( :adopt )
end

#update database with adopted animals owner_id
put '/adopt-me/:id/adopt' do
  animal = Animal.find(params[:id])
  animal.adopt(params[:owner_id])
  redirect to '/'
end
