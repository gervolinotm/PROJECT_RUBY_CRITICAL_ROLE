require('minitest/autorun')
require_relative('../dungeon_masters/campaign.rb')

class TestCampaign < MiniTest::Test

  def setup()
    @campaign1 = Campaign.new({
      "id" => 1,
      "campaign_name" => "Death House"
      })
  end

  def test_id()
    assert_equal(1, @campaign1.id)
  end

  def test_campaign_name()
    assert_equal("Death House", @campaign1.campaign_name)
  end

end
