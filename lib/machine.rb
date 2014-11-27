require './lib/product'

class Vending_Machine

  def initialize
    float
    products
  end

  def float
    @float ||= {'1p' => 100, '2p' => 50, '5p' => 100, '10p' => 50, '50p' => 10, "1pound" => 10, "2pound" => 5}
  end

  def load_coins(coins,amount)
    # @float[coins] = amount
    @float.update(@float){|k,v| amount+v}
  end

  def products
    @products ||= {chocolate = Product.new('chocolate', '50p') => 10}
  end

  def load_products(products, amount)
    @products.update(@products){|k,v| amount+v}
  end

  def buy(product, coins)
    raise error if @products[product] == 0
    @products.update(@products){|k,v| v-1}
    unless coins == product.price
      give_change(product, coins)
    end
  end

  def give_change(product, coins)
    


  end

end