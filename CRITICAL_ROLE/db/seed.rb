require('pry-byebug')

require_relative('../models/characters/character.rb')
require_relative('../models/characters/character_class.rb')
require_relative('../models/characters/race.rb')
require_relative('../models/characters/player.rb')

require_relative('../models/dungeon_masters/dungeon_master.rb')
require_relative('../models/dungeon_masters/campaign.rb')

CharacterDM.delete_all()
Character.delete_all()
Player.delete_all()
CharacterClass.delete_all()
Race.delete_all()
DungeonMaster.delete_all()
Campaign.delete_all()

#Player
player1 = Player.new({
  "first_name" => "Calum",
  "last_name" => "Nicol"
  })
player1.save()

player2 = Player.new({
  "first_name" => "Liam",
  "last_name" => "Morris"
  })
player2.save()

player3 = Player.new({
  "first_name" => "Ross",
  "last_name" => "McCarthy"
  })
player3.save()


#Class
class1 = CharacterClass.new({
  "class_name" => "Cleric"
  })
class1.save()

class2 = CharacterClass.new({
  "class_name" => "Barbarian"
  })
  class2.save()

class3 = CharacterClass.new({
  "class_name" => "Bard"
  })
  class3.save()

class4 = CharacterClass.new({
  "class_name" => "Ranger"
  })
  class4.save()

class5 = CharacterClass.new({
  "class_name" => "Sorcerer"
  })
  class5.save()

class6 = CharacterClass.new({
  "class_name" => "Rogue"
  })
  class6.save()

class7 = CharacterClass.new({
  "class_name" => "Wizard"
  })
  class7.save()

class8 = CharacterClass.new({
  "class_name" => "Paladin"
  })
  class8.save()

class9 = CharacterClass.new({
  "class_name" => "Druid"
  })
  class9.save()

class10 = CharacterClass.new({
  "class_name" => "Fighter"
  })
  class10.save()

class11 = CharacterClass.new({
  "class_name" => "Monk"
  })
  class11.save()

class12 = CharacterClass.new({
  "class_name" => "Warlock"
  })
  class12.save()


#Race
race1 = Race.new({
  "race" => "Half-Orc"
  })
race1.save()

race2 = Race.new({
  "race" => "Half-Elf"
  })
race2.save()

race3 = Race.new({
  "race" => "Halfling"
  })
race3.save()

race4 = Race.new({
  "race" => "Tiefling"
  })
race4.save()

race5 = Race.new({
  "race" => "Human"
  })
race5.save()

race6 = Race.new({
  "race" => "Drawf"
  })
race6.save()

race7 = Race.new({
  "race" => "Gnome"
  })
race7.save()

race8 = Race.new({
  "race" => "Dragonborn"
  })
race8.save()

race9 = Race.new({
  "race" => "Elf"
  })
race9.save()



#Character
character1 = Character.new({
  "player_id" => player2.id,
  "character_name" => "Rurich",
  "race_id" => race5.id,
  "character_class_id" => class1.id,
  "level" => "7"
})
 character1.save()

character2 = Character.new({
  "player_id" => player3.id,
  "character_name" => "Kirta",
  "race_id" => race7.id ,
  "character_class_id" => class7.id,
  "level" => "9"
})
character2.save()

character5 = Character.new({
  "player_id" => player1.id ,
  "character_name" => "Koopa",
  "race_id" => race6.id,
  "character_class_id" => class5.id,
  "level" => "3"
})
character5.save()


#Campaign
campaign1 = Campaign.new({
  "campaign_name" => "Curse of Stradh"
  })
campaign1.save()

campaign2 = Campaign.new({
  "campaign_name" => "Tomb of Annihilation"
  })
campaign2.save()


#DungeonMaster
dm1 = DungeonMaster.new({
  "dm_name" => "Calum",
  "campaign_id" => campaign1.id,
  "min_level" => "2",
  "max_level" => "4"
})
 dm1.save()

dm2 = DungeonMaster.new({
  "dm_name" => "John",
  "campaign_id" => campaign2.id,
  "min_level" => "7",
  "max_level" => "10"
})
 dm2.save()

 #CharacterDM
 assignment1 = CharacterDM.new({
   "dm_id" => dm1.id,
   "character_id" => character5.id
   })
assignment1.save()

 assignment2 = CharacterDM.new({
   "dm_id" => dm2.id,
   "character_id" => character2.id
   })
assignment2.save()

 assignment3 = CharacterDM.new({
   "dm_id" => dm2.id,
   "character_id" => character1.id
   })
assignment3.save()










binding.pry
nil
