require 'oystercard'

describe Oystercard do

  let(:entry_station) { double :entry_station }
  let(:card) { Oystercard.new }

  it 'should have a balance of 0' do
    expect(card.balance).to eq 0
  end

  it 'should respond to top_up method' do
    expect(subject).to respond_to(:top_up).with(1).argument
  end

  it 'should top up by given amount' do
    expect{card.top_up(20)}.to change{card.balance}.by(20)
  end

  it 'should not top up beyond £90' do
    maximum_amount = Oystercard.new.maximum_amount
    subject.top_up(maximum_amount)
    expect{subject.top_up(1)}.to raise_error "reached topup limit of #{maximum_amount}!"
  end

  it "should not allow user to touch_in if balance is less than the minimum required" do
    expect { card.touch_in("entry_station") }.to raise_error "You have less than #{Oystercard::Minimum_amount} on your card"
  end

  # it 'should deduct money by given amount' do
  #   subject.top_up(20)
  #   expect{subject.deduct(10)}.to change{subject.balance}.by(-10)
  # end

  it "deducts minimum fare from @balance when the user touches out" do
    card.top_up(Oystercard::Minimum_amount)
    card.touch_in(entry_station)
    expect{card.touch_out}.to change{card.balance}.by(-(Oystercard::Minimum_fare))
  end

  it 'can touch in' do
    card.top_up(Oystercard::Minimum_amount) 
    expect { card.touch_in(entry_station) }.to change{card.in_journey?}.from(false).to(true)
  end

  it 'should not be in journey' do
    card.top_up(Oystercard::Minimum_amount)
    card.touch_in(entry_station)
    card.touch_out
    expect(card).not_to be_in_journey
  end

  it "remembers the entry station after the touch in" do
    card.top_up(Oystercard::Minimum_amount)
    expect{ card.touch_in(entry_station) }.to change{card.entry_station}.to entry_station

  end

  it "forgets the entry station on touch out" do
    card.top_up(Oystercard::Minimum_amount)
    card.touch_in(entry_station)
    expect{ card.touch_out }.to change{card.entry_station}.to nil

  end

end
