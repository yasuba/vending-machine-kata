require 'machine'
require 'product'

describe Vending_Machine do

  let(:vending_machine) {Vending_Machine.new}
  let(:chocolate) {Product.new('chocolate', '50p')}

  it 'should be able to load coins' do
    vending_machine.load_coins('1p', 20)
    expect(vending_machine.float['1p']).to eq(120)
  end

  xit 'should be able to load products' do
  	vending_machine.load_products(chocolate, 10)
  	expect(vending_machine.products[chocolate]).to eq(20)
  end

  xit 'can sell products' do
  	vending_machine.buy(chocolate, '50p')
  	expect(vending_machine.products[chocolate]).to eq(9)
  end

  xit 'cannot sell products if sold out' do
  	vending_machine.products[chocolate] = 0
  	expect{vending_machine.buy(chocolate, '50p')}.to raise_error
  end

  xit 'should check the money paid matches the price of the product sold' do
  	vending_machine.buy(chocolate, '1pound')
  	expect(vending_machine.give_change(chocolate, '1pound')).to eq('50p')
  end

end