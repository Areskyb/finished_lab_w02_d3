require ("minitest/autorun")
require ("minitest/rg")

require_relative("../drink.rb")


class TestDrink < MiniTest::Test

  def test_has_attr
    drink = Drink.new("Jack Daniels", 5, 0.4)
    assert_equal("Jack Daniels", drink.name)
    assert_equal(5, drink.price)
    assert_equal(0.4, drink.alcohol_level)
  end

end
