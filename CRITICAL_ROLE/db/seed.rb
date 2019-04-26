require('pry-byebug')
require_relative('../models/character.rb')
require_relative('../models/dungeon_master.rb')



dm1 = DungeonMaster.new(
  "dm_name" = "Calum",
  "campaign" = "Curse of Stradh",
  "level_req" = "2"
)
# dm1.save()

dm2 = DungeonMaster.new(
  "dm_name" = "John",
  "campaign" = "Tomb of Annihilation",
  "level_req" = "7"
)
# dm2.save()


character1 = Character.new(
  "player_name" = "Liam",
  "character_name" = "Rurich",
  "race" = "human",
  "character_class" = "cleric",

)



binding.pry
nil
