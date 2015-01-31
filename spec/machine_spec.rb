require 'machine'
require 'product'

describe Vending_Machine do

  let(:vending_machine) {Vending_Machine.new}
  let(:chocolate) {Product.new('chocolate', 50)}
  let(:crips) {Product.new('crisps', 60)}

  before(:each) do
    vending_machine.load_products(chocolate)
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

  it "should only keep money to the value of the product's price" do
    vending_machine.give_change('chocolate', 100)
    vending_machine.buy('chocolate', 100)
    expect(vending_machine.total).to eq(4350)
  end

  it 'should return correct change after the purchase' do
    vending_machine.give_change('chocolate', 200)
    vending_machine.buy('chocolate', 200)
    expect(vending_machine.float).to eq({200 => 6, 100 => 4, 50 => 9, 20 => 50, 10 => 50, 5 => 100, 2 => 100, 1 => 100})
  end

  it 'should be able to reset the float' do
    expect(vending_machine.add_coins).to eq({200 => 5, 100 => 5, 50 => 10, 20 => 50, 10 => 50, 5 => 100, 2 => 100, 1 => 100})
  end

end