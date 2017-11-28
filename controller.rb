require( 'sinatra' )
require( 'sinatra/reloader' )
require( 'pry-byebug' )

require_relative('./models/owner')
require_relative('./models/animal')
require_relative('./controllers/animals_controller')
require_relative('./controllers/owners_controller')


#index see all animals
get '/' do
  erb ( :index )
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
