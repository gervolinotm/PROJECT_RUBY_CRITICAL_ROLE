require('minitest/autorun')
require_relative('../characters/character.rb')

class TestCharacter < Minitest::Test

   def setup()
     @player1 = Player.new({
       "id" => 1,
       "first_name" => "Liam",
       "last_name" => "Morris"
       })

      @race1 = Race.new({
        "id" => 1,
        "race" => "Elf"
        })

      @class1 = CharacterClass.new({
        "id" => 1,
        "class_name" => "Cleric"
        })

      @character1 = Character.new({
        "id" => 1,
        "player_id" => 1,
        "character_name" => "Rurich",
        "race_id" => 1,
        "character_class_id" => 1,
        "level" => 2
        })

   end

   def test_character_id()
     result = @character1.id
     assert_equal(1, result)
   end

   def test_player_id()
     assert_equal(1, @character1.player_id)
   end

   def test_character_name()
     assert_equal("Rurich", @character1.character_name)
   end

   def test_race_id()
     assert_equal(1, @character1.race_id)
   end

   def test_character_class_id()
     assert_equal(1, @character1.character_class_id)
   end

   def test_character_level()
     assert_equal(2, @character1.level)
   end


end
