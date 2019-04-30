require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/characters/character.rb')
require_relative('../models/characters/character_class.rb')
require_relative('../models/characters/player.rb')
require_relative('../models/characters/race.rb')
require_relative('../models/dungeon_masters/dungeon_master.rb')
require_relative('../models/dungeon_masters/campaign.rb')
also_reload('../models/*')

get '/players' do
  @players = Player.all()
  erb(:"players/index")
end

get '/players/register' do
  erb(:"players/register")
end

post '/players' do
  @player = Player.new( params )
  @player.save()
  erb(:"players/create")
end

post '/players/:id/delete' do
  Player.destroy( params['id'].to_i )
  redirect to ('/players')
end
