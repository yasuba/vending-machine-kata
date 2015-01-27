require './lib/product'

class Vending_Machine

  def initialize
    float
    products
  end

  def float
    @float ||= {1 => 100, 2 => 100, 5 => 100, 10 => 50, 50 => 10, 100 => 5, 200 => 5}
  end

  def total
    total = []
    @float.each_pair do |k, v|
      total << k * v
    end
    total.inject(:+)
  end

  def load_coins(coins,amount)
    @float.update(@float) {|k,v| coins == k ? v+amount : v }
  end

  def products
    @products ||= [Product::CHOCOLATE, Product::CRISPS]
  end

  def load_products(product)
    products << product
    # @products.update(@products){|k,v| amount+v}
  end

  def quantity(product)
    quantity = []
    products.each {|p| p.name == product.name ? quantity << p : nil}
    quantity.count
  end

  def sorting(product)
    @s = products.select {|p| p.name == product.name}
  end

  def buy(product, coins)
    raise "That item is sold out" if quantity(product) == 0
    products.reject!{|p| p.name == product.name}
    @float.update(@float) {|k,v| coins == k ? v+1 : v }
  end

  def give_change(product, coins)
    coins - product.price
  end

end