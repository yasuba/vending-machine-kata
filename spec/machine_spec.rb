require 'machine'
require 'product'

describe Vending_Machine do

  let(:vending_machine) {Vending_Machine.new}
  let(:chocolate) {double :product, name: 'chocolate', price: 50,  image: './images/kitkat.png'}
  let(:crisps) {double :product, name:'crisps', price: 60, image: './images/kitkat.png'}

  before(:each) do
    vending_machine.load_products(chocolate)
    vending_machine.load_products(crisps)
  end

  it 'should be able to load coins' do
    vending_machine.load_coins(1, 20)
    expect(vending_machine.float[1]).to eq(120)
  end

  it 'should know the total value of its coins' do
    expect(vending_machine.total).to eq(4300)
  end

  it 'should be able to load products' do
    vending_machine.load_products(chocolate)
    expect(vending_machine.products).to include(chocolate)
  end

  it 'should know the quantities of products it contains' do
    expect(vending_machine.quantity('chocolate')).to eq(1)
  end

  it 'can sell products' do
    vending_machine.buy('chocolate', 50)
    expect(vending_machine.products).to_not include(chocolate)
  end

  it 'once a product is sold, can update its float' do
    vending_machine.buy('chocolate', 50)
    expect(vending_machine.float[50]).to eq(11)
  end

  it 'cannot sell products if sold out' do
    vending_machine.buy('chocolate', 50)
    expect{vending_machine.buy('chocolate', 50)}.to raise_error
  end

  it 'should return correct change after the purchase' do
    expect(vending_machine.give_change('chocolate', 'crisps', 200)).to eq([50, 20, 20])
    expect(vending_machine.float).to eq({200 => 5, 100 => 5, 50 => 9, 20 => 48, 10 => 50, 5 => 100, 2 => 100, 1 => 100})
  end

  it 'should be able to reset the float' do
    vending_machine.reset_float
    expect(vending_machine.float).to eq({200 => 5, 100 => 5, 50 => 10, 20 => 50, 10 => 50, 5 => 100, 2 => 100, 1 => 100})
  end

  it 'can sell more than one product at a time' do
    vending_machine.buy('chocolate', 'crisps', 200)
    expect(vending_machine.products).to_not include(chocolate && crisps)
  end

  it 'can vend products once bought' do
    expect(vending_machine.buy('chocolate', 'crisps', 200)).to eq([chocolate, crisps])
  end

end