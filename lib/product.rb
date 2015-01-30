class Product

  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  TWIRL = Product.new('twirl', 99)
  KITKAT = Product.new('kitkat', 99)
  WALKERS = Product.new('walkers', 70)
  MCCOYS = Product.new('mccoys', 89)
  SPACEINVADERS = Product.new('spaceinvaders', 15)
  COLA = Product.new('cola', 100)
  EVIAN = Product.new('evian', 78)
  GUM = Product.new('gum', 68)

end