require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/characters/character.rb')
require_relative('../models/characters/character_class.rb')
require_relative('../models/characters/player.rb')
require_relative('../models/characters/race.rb')
require_relative('../models/dungeon_masters/dungeon_master.rb')
require_relative('../models/dungeon_masters/campaign.rb')
require_relative('../models/character_dm.rb')
also_reload('../models/*')

get '/dungeon-masters/:id/add-table' do
  @dm = DungeonMaster.find( params['id'].to_i )
  @characters = Character.all()
  erb(:"character_dms/add_table")
end

post '/dungeon-masters/:id' do
  for param in params
    @character_dm = CharacterDM( param )
    @character_dm.save()
  end
  erb(:"character_dms/create")
end

get '/dungeon-masters/:id/tables' do
   @dm = DungeonMaster.find( params['id'].to_i )
   erb(:"character_dms/display")
end
