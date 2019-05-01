require('sinatra')
require('sinatra/contrib/all')
require_relative('./controllers/characters_controller')
require_relative('./controllers/dungeon_masters_controller')
require_relative('./controllers/campaigns_controller')
require_relative('./controllers/players_controller')
require_relative('./controllers/character_dms_controller')


get '/' do
  erb (:index)
end
