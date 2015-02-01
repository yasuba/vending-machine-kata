class Product

  attr_reader :name, :price, :image

  def initialize(name, price, image)
    @name = name
    @price = price
    @image = image
  end

  TWIRL = Product.new('twirl', 99, './images/kitkat.png')
  KITKAT = Product.new('kitkat', 99, './images/twirl.png')
  WALKERS = Product.new('walkers', 70, './images/walkers.png')
  MCCOYS = Product.new('mccoys', 89, './images/mccoys.png')
  SPACERAIDERS = Product.new('spaceraiders', 20, './images/spaceraiders.png')
  COLA = Product.new('cola', 100, './images/coke.png')
  SPRITE = Product.new('evian', 78, './images/sprite.png')
  GUM = Product.new('gum', 68, './images/gum.png')

end