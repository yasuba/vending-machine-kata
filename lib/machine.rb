require './lib/product'

class Vending_Machine

  attr_accessor :float

  def initialize
    reset_float
    products
  end

  def total
    float.map {|k, v| k * v}.inject(:+)
  end

  def load_coins(coins,amount)
    float.update(float) {|k,v| coins == k ? v+amount : v }
  end

  def products
    @products ||= [Product::TWIRL, Product::KITKAT, Product::WALKERS, Product::MCCOYS, Product::SPACERAIDERS, Product::COLA, Product::SPRITE, Product::GUM]
  end

  def load_products(product)
    products << product
  end

  def quantity(product)
    products.select {|p| p if p.name == product}.count
  end

  def buy(*args, coins)
    # give_change(args, coins)
    purchase = []
    float.update(float) {|k,v| coins == k ? v+1 : v }
    args.compact.each do |product|
      raise "That item is sold out" if quantity(product) == 0
      purchase << products.select{|p| p.name == product}
      products.reject!{|p| p.name == product}
    end
    purchase.flatten
  end

  def give_change(*args, coins)
    args = args.compact.flatten
    diff = []
    prod = []
    args.each do |product|
      products.select {|p| prod << p.price if p.name == product }
    end
    change = coins - prod.inject(:+)
    float.merge!(float) do |k, v|
      (change / k).times {v -= 1; diff << k; change -= k}
      v
    end
    diff
  end

  def reset_float
    self.float = {200 => 5, 100 => 5, 50 => 10, 20 => 50, 10 => 50, 5 => 100, 2 => 100, 1 => 100}
  end

end