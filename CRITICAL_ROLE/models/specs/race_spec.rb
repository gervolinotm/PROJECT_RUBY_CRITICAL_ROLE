require('minitest/autorun')
require_relative('../characters/race.rb')



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

end
