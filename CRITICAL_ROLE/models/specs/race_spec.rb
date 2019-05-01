require('minitest/autorun')
require_relative('../characters/race.rb')
# require_relative('../characters/character_class.rb')


class TestRace <MiniTest::Test

   def setup()
      options = {"id" => 1, "race" => "Elf"}

      @race1 = Race.new(options)
   end

   def test_id()
     result = @race1.id()
     assert_equal(1,result)
   end

   def test_race()
     result = @race1.race
     assert_equal("Elf", result)
   end
   #
   # def setup()
   #    options = { "id" => 1, "class_name" => "Cleric"}
   #
   #    @class1 = CharacterClass.new(options)
   # end
   #
   # def test_id()
   #   result = @class1.id()
   #   assert_equal(1,result)
   # end
   #
   # def test_class()
   #   result = @class1.class_name
   #   assert_equal("Cleric", result)
   # end
   #
   # def setup()
   #   options = { "id" => 1, "first_name" => "Liam", "last_name" => "Morris"}
   #
   #   @player1 = Player.new(options)
   # end
   #
   # def test_id()
   #   result = @player1.id()
   #   assert_equal(1,result)
   # end
   #
   # def test_first_name()
   #   result = @player1.first_name
   #   assert_equal("Liam", result)
   # end
   #
   # def test_last_name()
   #   result = @player1.last_name
   #   assert_equal("Morris", result)
   # end
   #
   # def test_format_name()
   #   result = @player1.format_name
   #   assert_equal("Liam Morris", result)
   # end

end
