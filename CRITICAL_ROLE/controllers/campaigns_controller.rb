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

get '/campaigns' do
  @campaigns = Campaign.all()
  erb(:"campaigns/index")
end

get '/campaigns/add' do
  erb(:"campaigns/add")
end

post '/campaigns' do
  @campaign = Campaign.new( params )
  @campaign.save()
  erb(:"campaigns/create")
end

get '/campaigns/:id/edit' do
  @campaign = Campaign.find( params['id'].to_i )
  erb(:"campaigns/edit")
end

post '/campaigns/:id' do
  @campaign = Campaign.new( params )
  @campaign.update()
  redirect to ('/campaigns')
end

post '/campaigns/:id/delete' do
  Campaign.destroy( params['id'].to_i )
  redirect to ('/campaigns')
end
