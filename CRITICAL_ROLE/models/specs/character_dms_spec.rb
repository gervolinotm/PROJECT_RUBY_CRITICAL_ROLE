require('minitest/autorun')
require_relative('../character_dm.rb')

class TestCharacterDM < MiniTest::Test

   def setup()

     @character_dm1 = CharacterDM.new({
       "dm_id" => 1,
       "character_id" => 2
       })

   end

   def test_dm_id()
     assert_equal(1, @character_dm1.dm_id)
   end

   def test_character_id()
     assert_equal(2, @character_dm1.character_id)
   end

end
