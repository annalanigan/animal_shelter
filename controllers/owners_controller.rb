require( 'sinatra' )
require( 'sinatra/reloader' )
require( 'pry-byebug' )

require_relative('../models/owner')
require_relative('../models/animal')

# INDEX owners and adopted animals
get '/owners' do
  @table = Owner.animals
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

# DELETE an owner
delete 'owner/:id' do
  owner = Owner.find(params[:id])
  owner.delete
  redirect to '/owners'
end
