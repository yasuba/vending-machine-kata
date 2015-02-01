class Product

  attr_reader :name, :price, :image

  def initialize(name, price, image)
    @name = name
    @price = price
    @image = image
  end

  TWIRL = Product.new('twirl', 99, './images/kitkat.png')
  KITKAT = Product.new('kitkat', 99, './images/kitkat.png')
  WALKERS = Product.new('walkers', 70, './images/kitkat.png')
  MCCOYS = Product.new('mccoys', 89, './images/kitkat.png')
  SPACEINVADERS = Product.new('spaceinvaders', 15, './images/kitkat.png')
  COLA = Product.new('cola', 100, './images/kitkat.png')
  EVIAN = Product.new('evian', 78, './images/kitkat.png')
  GUM = Product.new('gum', 68, './images/kitkat.png')

end