require( 'sinatra' )
require( 'sinatra/reloader' )
require( 'pry-byebug' )

require_relative('../models/owner')
require_relative('../models/animal')

# INDEX owners and adopted animals
get '/owners' do
  @table = Owner.animals
  @table2 = Owner.owners_no_pets
  @owners = Owner.all
  @animals = Animal.all
  erb( :"owners/index" )
end

#get form to CREATE new owner
get '/owners/new' do
  @owners = Owner.all
  erb ( :"owners/new")
end

# create NEW owner
post '/owners' do
  @owners = Owner.new(params)
  @owners.save
  redirect to '/owners'
end

get '/owners/:id' do
  @owners = Owner.find(params["id"])
  erb (:"owners/show")
end

# get form to EDIT owner
get '/owners/:id/edit' do
  @owners = Owner.find(params[:id])
  erb ( :"owners/edit" )
end

# UPDATE owner
put '/owners/:id' do
  Owner.new( params ).update
  redirect to '/owners'
end

# SHOW

get '/owners/:id/delete' do
  erb (:"owners/delete")
end

# DELETE an owner
delete '/owners/:id' do
  owner = Owner.find(params[:id])
  owner.delete
  redirect to '/owners'
end
