class Customer

  attr_accessor :name, :wallet, :age, :drunkness_level


  def initialize(name, wallet, age, drunkness_level)
    @name = name
    @wallet = wallet
    @age = age
    @drunkness_level = 0
  end

  def buy_drink(pub, drink)
      @wallet -= drink.price
      pub.till += drink.price
      pub.stock[drink] -= 1
      add_drunk_level
  end

  def add_drunk_level
    @drunkness_level += 1
  end

  def eat(food)
  @drunkness_level -= 1
  @wallet -= food.price
  end


end
