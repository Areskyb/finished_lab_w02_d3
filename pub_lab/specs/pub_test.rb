require ("minitest/autorun")
require ("minitest/rg")

require_relative("../pub.rb")
require_relative("../drink.rb")
# require_relative("../food.rb")
require_relative("../customer.rb")



class TestPub < MiniTest::Test

  def setup

    @drink1 = Drink.new("Jack Daniels", 6, 0.4)
    @drink2 = Drink.new("Smirnoff", 5, 0.4)
    @drink3 = Drink.new("Famous Grouse", 7, 0.4)

    @customer1 = Customer.new("Cameron", 500, 69, 0)
    @customer2 = Customer.new("Aresky", 500, 69, 0)


    # @stock = [@drink1, @drink2, @drink3]
    @stock = {
      @drink1 => 3,
      @drink2 => 2,
      @drink3 => 4
    }

    @pub = Pub.new("4042", 2000, @stock)

  end

  def test_has_attr
    assert_equal("4042", @pub.name)
    assert_equal(2000, @pub.till)
    assert_equal(@stock, @pub.stock)
  end

  def test_pub_stock_level
    assert_equal(3, @pub.get_stock(@drink1))
  end

  def test_reduce_stock
    @pub.reduce_stock(@drink1)
    assert_equal(2, @pub.get_stock(@drink1))
  end

  def test_check_age
    assert_equal(true,@pub.check_age(@customer1))
  end

  def test_refuse
    assert_equal("sorry we don't sell to kids, get out!!", @pub.refuse(@customer1))
  end

  def test_total_value_stock
  assert_equal(56,@pub.total_value_stock)
end

end
