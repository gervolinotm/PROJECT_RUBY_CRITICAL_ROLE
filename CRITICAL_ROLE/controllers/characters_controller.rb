require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/character.rb')
require_relative('../models/dungeon_master.rb')
also_reload('../models/*')

get '/characters' do
  @characters = Character.all()
  erb(:"characters/index")
end

get '/characters/:id' do
  @character = Character.find( params['id'].to_i )
  erb(:"characters/show")
end
