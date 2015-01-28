require 'machine'
require 'product'

describe Vending_Machine do

  let(:vending_machine) {Vending_Machine.new}
  let(:chocolate) {Product.new('chocolate', 50)}
  let(:crisps) {Product.new('crisps', 60)}

  it 'should be able to load coins' do
    vending_machine.load_coins(1, 20)
    expect(vending_machine.float[1]).to eq(120)
  end

  it 'should know the total value of its coins' do
    expect(vending_machine.total).to eq(3300)
  end

  it 'should be able to load products' do
    vending_machine.load_products(chocolate)
    expect(vending_machine.products).to include(chocolate)
  end

  it 'should know the quantities of products it contains' do
    expect(vending_machine.quantity(chocolate)).to eq(1)
  end

  it 'can sell products' do
    vending_machine.buy(chocolate, 50)
    expect(vending_machine.products).to_not include(chocolate)
  end

  it 'once a product is sold, can update its float' do
    vending_machine.buy(chocolate, 50)
    expect(vending_machine.float[50]).to eq(11)
  end

  it 'cannot sell products if sold out' do
    vending_machine.buy(chocolate, 50)
    expect{vending_machine.buy(chocolate, 50)}.to raise_error
  end

  it "should only keep money to the value of the product's price" do
    vending_machine.buy(chocolate, 100)
    expect(vending_machine.total).to eq(3350)
  end


end