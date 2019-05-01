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

get "/dungeon-masters" do
  @dms = DungeonMaster.all()
  erb(:"dungeon_masters/index")
end

get "/dungeon-masters/new" do
  @campaigns = Campaign.all()
  @dms = DungeonMaster.all()
  erb(:"dungeon_masters/new")
end

get "/dungeon-masters/:id" do
  @dm = DungeonMaster.find( params['id'].to_i)
  erb(:"dungeon_masters/show")
end

post "/dungeon-masters" do
  @dm = DungeonMaster.new( params )
  @dm.save()
  erb(:"dungeon_masters/create")
end

get "/dungeon-masters/:id/edit" do
  @campaigns = Campaign.all()
  @dm = DungeonMaster.find( params['id'].to_i)
  erb(:"dungeon_masters/edit")
end


post "/dungeon-masters/:id" do
  @dm = DungeonMaster.new( params )
  @dm.update()
  erb(:"dungeon_masters/show")
end

post "/dungeon-masters/:id/delete" do
  DungeonMaster.destroy( params['id'] )
  redirect to ('/dungeon-masters')
end
