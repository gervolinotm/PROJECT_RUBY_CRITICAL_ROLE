require('pry-byebug')
require_relative('../models/characters/character.rb')
require_relative('../models/characters/character_class.rb')
require_relative('../models/characters/race.rb')
require_relative('../models/characters/player.rb')
require_relative('../models/dungeon_masters/dungeon_master.rb')
require_relative('../models/dungeon_masters/campaign.rb')

Character.delete_all()
DungeonMaster.delete_all()

dm1 = DungeonMaster.new({
  "dm_name" => "Calum",
  "campaign" => "Curse of Stradh",
  "level_req" => "2"
})
 dm1.save()

dm2 = DungeonMaster.new({
  "dm_name" => "John",
  "campaign" => "Tomb of Annihilation",
  "level_req" => "7"
})
 dm2.save()


character1 = Character.new({
  "player_name" => "Liam",
  "character_name" => "Rurich",
  "race" => "Human",
  "character_class" => "Cleric",
  "level" => "7",
  "dm_id" => dm2.id
})
 character1.save()

character2 = Character.new({
  "player_name" => "Ross",
  "character_name" => "Kirta",
  "race" => "Gnome",
  "character_class" => "Wizard",
  "level" => "9",
  "dm_id" => dm2.id
})
character2.save()

character3 = Character.new({
  "player_name" => "Thomas",
  "character_name" => "Kayla",
  "race" => "Aasimar",
  "character_class" => "Barbarian",
  "level" => "5",
  "dm_id" => dm1.id
})
character3.save()

character4 = Character.new({
  "player_name" => "Harry",
  "character_name" => "Heskan",
  "race" => "Dragonborn",
  "character_class" => "Monk",
  "level" => "8",
  "dm_id" => dm2.id
})
character4.save()

character5 = Character.new({
  "player_name" => "Calum",
  "character_name" => "Koopa",
  "race" => "Tortle",
  "character_class" => "Sorceror",
  "level" => "3",
  "dm_id" => dm1.id
})
character5.save()





binding.pry
nil
