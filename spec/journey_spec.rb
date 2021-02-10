require 'journey'

describe Journey do
  let(:entry_station) { double :entry_station }
  let(:exit_station) { double :exit_station }
  let(:journey) { Journey.new(entry_station) }

it "stores the entry station" do
  expect(journey.entry_station).to eq entry_station
end

# it "store the exit station" do
#   expect(journey.exit_station).to eq exit_station
# end

it "initiates a new journey with no exit station" do
  expect(journey.exit_station).to eq nil
end

end
