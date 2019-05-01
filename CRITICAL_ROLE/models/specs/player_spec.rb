require('minitest/autorun')
require_relative('../characters/player.rb')


class TestPlayer < MiniTest::Test

  def setup()
    options = { "id" => 1, "first_name" => "Liam", "last_name" => "Morris"}

    @player1 = Player.new(options)
  end

  def test_id()
    result = @player1.id()
    assert_equal(1,result)
  end

  def test_first_name()
    result = @player1.first_name
    assert_equal("Liam", result)
  end

  def test_last_name()
    result = @player1.last_name
    assert_equal("Morris", result)
  end

  def test_format_name()
    result = @player1.format_name
    assert_equal("Liam Morris", result)
  end




end
