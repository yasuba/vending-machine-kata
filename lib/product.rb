class Product

	attr_reader :name, :price

	def initialize(name, price)
		@name = name
		@price = price
	end

  CHOCOLATE = Product.new('chocolate', 50)
  CRISPS = Product.new('crisps', 60)

end