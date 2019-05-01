require('minitest/autorun')
require_relative('../characters/character_class.rb')

class TestCharacterClass < MiniTest::Test


  def setup()
     options = { "id" => 1, "class_name" => "Cleric"}

     @class1 = CharacterClass.new(options)
  end

  def test_id()
    result = @class1.id()
    assert_equal(1,result)
  end

  def test_class()
    result = @class1.class_name
    assert_equal("Cleric", result)
  end

end
