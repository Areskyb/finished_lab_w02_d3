require ("minitest/autorun")
require ("minitest/rg")

require_relative("../pub.rb")
require_relative("../drink.rb")
require_relative("../food.rb")
require_relative("../customer.rb")

class TestCustomer < MiniTest::Test

  def setup()
    @customer1 = Customer.new("Cameron", 500, 69, 0)
    @customer2 = Customer.new("Aresky", 500, 69, 0)



    @drink1 = Drink.new("Jack Daniels", 6, 0.4)
    @drink2 = Drink.new("Smirnoff", 5, 0.4)
    @drink3 = Drink.new("Famous Grouse", 7, 0.4)

    # @stock = [@drink1, @drink2, @drink3]
    @burger = Food.new("burger", 5)

    @stock = {
      @drink1 => 3,
      @drink2 => 2,
      @drink3 => 4
    }


        @pub = Pub.new("4042", 2000, @stock)
  end

  def test_has_attr
    assert_equal("Cameron", @customer1.name)
    assert_equal(500, @customer1.wallet)
    assert_equal(69, @customer1.age)
    assert_equal(0, @customer1.drunkness_level)
  end

  def test_pub_stock_level
    assert_equal(3,@stock[@drink1])
  end

  def test_buy_drink()
    @customer1.buy_drink(@pub, @drink1)
    assert_equal(494, @customer1.wallet)
    assert_equal(2006, @pub.till)
    assert_equal(1, @customer1.drunkness_level)
  end

  def test_reduce_drunkness_level
    @customer1.buy_drink(@pub, @drink1)
    @customer1.eat(@burger)
    assert_equal(0, @customer1.drunkness_level)
  end
  #
  def test_buy_food
    @customer1.eat(@burger)
    assert_equal(495, @customer1.wallet)
  end

end
