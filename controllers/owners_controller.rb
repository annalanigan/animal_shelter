require( 'sinatra' )
require( 'sinatra/reloader' )
require( 'pry-byebug' )

require_relative('../models/owner')
require_relative('../models/animal')

#see all owners and adopted animals
get '/owners' do
  @table = Owner.animals
  @owners = Owner.all
  @animals = Animal.all
  erb( :"owners/index" )
end

#get form to create new owner
get '/owners/new' do
  @owners = Owner.all
  erb ( :"owners/new")
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
  erb ( :"owners/edit" )
end

# update owner
put '/owners/:id' do
  Owner.new( params ).update
  redirect to '/owners'
end
