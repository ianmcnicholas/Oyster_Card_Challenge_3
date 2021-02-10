require 'station'

describe Station do
  let(:bank) { Station.new(:bank, 1) }

  it 'has a name' do
    expect(bank.name).to eq :bank
  end
  it 'has a zone' do
    expect(bank.zone).to eq 1
  end

end
