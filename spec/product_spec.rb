require 'product'

describe Product do

	let(:chocolate) {Product.new('chocolate', '50p')}

	it 'should have a name' do
		expect(chocolate.name).to eq('chocolate')
	end

	it 'should have a price' do
		expect(chocolate.price).to eq('50p')
	end

end