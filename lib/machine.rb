require './lib/product'

class Vending_Machine

  def initialize
    float
    products
  end

  def float
    @float ||= {200 => 5, 100 => 5, 50 => 10, 20 => 50, 10 => 50, 5 => 100, 2 => 100, 1 => 100}
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
    @products ||= [Product::TWIRL, Product::KITKAT, Product::WALKERS, Product::MCCOYS, Product::SPACEINVADERS, Product::COLA, Product::EVIAN, Product::GUM]
  end

  def load_products(product)
    products << product
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
    give_change(product,coins)
  end

  def give_change(product, coins)
    change = coins - product.price
    diff = []
    @float.merge!(@float) do |k, v|
      (change / k).times {v -= 1; diff << k; change -= k}
      v
    end
    diff
  end

  def add_coins
    @float = {200 => 5, 100 => 5, 50 => 10, 20 => 50, 10 => 50, 5 => 100, 2 => 100, 1 => 100}
  end

end