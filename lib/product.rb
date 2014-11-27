class Product

	# CHOCOLATE = Product.new('chocolate', '50p')

	attr_reader :name, :price

	def initialize(name, price)
		@name = name
		@price = price
	end

end