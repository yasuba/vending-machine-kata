require 'coin'

describe Coin do
  
  let(:coin) {Coin.new('1p')}

  it 'should have a denomination' do
    expect(coin.denomination).to eq '1p'
  end

end