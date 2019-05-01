require('minitest/autorun')
require_relative('../dungeon_masters/dungeon_master.rb')
require_relative('../dungeon_masters/campaign.rb')

class TestDungeonMaster < MiniTest::Test

   def setup()
     @campaign1 = Campaign.new({
       "id" => 1,
       "campaign_name" => "Death House"
       })

      @dungeon_master1 = DungeonMaster.new({
        "id" => 1,
        "dm_name" => "Luke",
        "campaign_id" => 1,
        "min_level" => 1,
        "max_level" => 3
        })
   end

   def test_dungeon_master_id()
     assert_equal(1, @dungeon_master1.id)
   end

   def test_dm_name()
     assert_equal("Luke", @dungeon_master1.dm_name)
   end

   def test_campaign_id()
     assert_equal(1, @dungeon_master1.campaign_id)
   end

   def test_dungeon_master_min_level()
     assert_equal(1, @dungeon_master1.min_level)
   end

   def test_dungeon_master_max_level()
     assert_equal(3, @dungeon_master1.max_level)
   end


end
