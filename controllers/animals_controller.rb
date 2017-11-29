require( 'sinatra' )
require( 'sinatra/reloader' )
require( 'pry-byebug' )

require_relative('../models/owner')
require_relative('../models/animal')

#index see all animals
get '/animals' do
  @animals = Animal.all
  erb ( :"animals/index" )
end

#get form to create new animal
get '/animals/new' do
  @animals = Animal.all
  erb ( :"animals/new" )
end

# create new animal
post '/animals' do
  @animal = Animal.new(params)
  @animal.save
  redirect to '/animals'
end

# to see details of an individual animals
get '/animals/:id' do
  @animal = Animal.find(params[:id])
  erb ( :"animals/show" )
end

# get form to update animal
get '/animals/:id/edit' do
  @animal = Animal.find(params[:id])
  @owners = Owner.all
  erb ( :"animals/edit" )
end

# update animal
put '/animals/:id' do
  Animal.new( params ).update
  redirect to '/animals'
end
