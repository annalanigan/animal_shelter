require( 'sinatra' )
require( 'sinatra/reloader' )
require( 'pry-byebug' )

require_relative('../models/owner')
require_relative('../models/animal')

# INDEX see all animals
get '/animals' do
  @animals = Animal.all
  erb ( :"animals/index" )
end

#get form to CREATE new animal
get '/animals/new' do
  @animals = Animal.all
  erb ( :"animals/new" )
end

# create NEW animal
post '/animals' do
  @animal = Animal.new(params)
  @animal.save
  redirect to '/animals'
end

# to SHOW details of an individual animals
get '/animals/:id' do
  @animal = Animal.find(params[:id])
  erb ( :"animals/show" )
end

# get form to EDIT animal
get '/animals/:id/edit' do
  @animal = Animal.find(params[:id])
  @owners = Owner.all
  erb ( :"animals/edit" )
end

# UPDATE animal
put '/animals/:id' do
  Animal.new( params ).update
  redirect to '/animals'
end

# confirm delete animal
get '/animals/:id/delete' do
  @animal = Animal.find(params[:id])
  erb (:"animals/delete")
end

# DELETE animal
delete '/animals/:id' do
  animal = Animal.find(params[:id])
  animal.delete
  redirect to '/animals'
end
