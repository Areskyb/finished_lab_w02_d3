class Pub

 attr_accessor :name, :stock, :till

 def initialize(name, till, stock)
   @name = name
   @till = till
   @stock = stock
 end

 def get_stock(drink)
   return @stock[drink]
 end

 def reduce_stock(drink)
      @stock[drink] -= 1
 end

  def check_age(customer)
    customer.age >= 18 ? true : false
  end

  def refuse(customer)
    check_age(customer) ?  "sorry we don't sell to kids, get out!!" : "Hey pal!"
  end

  def total_value_stock
    result = 0
    @stock.each{|key, value| result += key.price * value }
    return result
    end

    end
