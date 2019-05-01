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
  erb(:"character_dms/new")
end

post '/character_dms' do
  for character_id in params['character_ids']
    @character_dm = CharacterDM.new({ "dm_id" => params['dm_id'], "character_id" => character_id})
    @character_dm.save()
  end
  erb(:"character_dms/create")
end

post '/dungeon-masters/:id/character-dms/delete-party' do
  @dm = DungeonMaster.find( params['id'] )
  DungeonMaster.delete_party( @dm.id )
  redirect to ("/dungeon-masters")
end
