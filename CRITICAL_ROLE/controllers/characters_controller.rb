require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/characters/character.rb')
require_relative('../models/characters/character_class.rb')
require_relative('../models/characters/player.rb')
require_relative('../models/characters/race.rb')
require_relative('../models/dungeon_masters/campaign.rb')
require_relative('../models/dungeon_masters/dungeon_master.rb')
also_reload('../models/*')

get '/characters' do
  @characters = Character.all()
  erb(:"characters/index")
end

get '/characters/new' do
  @players = Player.all()
  @races = Race.all()
  @classes = CharacterClass.all()
  erb(:"characters/new")
end

get '/characters/:id' do
  @character = Character.find( params['id'].to_i )
  erb(:"characters/show")
end

post '/characters' do
  @character = Character.new( params )
  @character.save()
  erb(:"characters/create")
end

get '/characters/:id/edit' do
  @dms = DungeonMaster.all()
  @character = Character.find( params['id'].to_i )
  erb(:"characters/edit")
end

post '/characters/:id' do
  @character = Character.new( params )
  @character.update()
  erb(:"characters/show")
end

post '/characters/:id/delete' do
  Character.destroy(params['id'])
  redirect to('/characters')
end
