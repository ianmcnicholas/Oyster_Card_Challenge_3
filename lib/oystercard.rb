class Oystercard
attr_reader :balance, :maximum_amount, :latest_journey, :entry_station, :exit_station, :journey_history
MAXIMUM_AMOUNT = 90
Minimum_amount = 1
Minimum_fare = 1

  def initialize(topup_limit = MAXIMUM_AMOUNT)
    @balance = 0
    @maximum_amount = topup_limit
    # @entry_station = nil
    # @exit_station = nil
    @journey_history = []
    @latest_journey = {}
  end

  def top_up(amount)
    fail "reached topup limit of #{maximum_amount}!" if @balance + amount > @maximum_amount
    @balance += amount
  end

  def touch_in(entry_station)
    fail "You have less than #{Minimum_amount} on your card" if @balance < Minimum_amount
    # @entry_station = entry_station
    @latest_journey[:entry] = entry_station
  end

  def touch_out(exit_station)
    deduct(Minimum_fare)
    # @exit_station = exit_station
    @latest_journey[:exit] = exit_station
    @journey_history.push @latest_journey
    @latest_journey = {}
    # @entry_station = nil
  end

  def in_journey?
    true if @latest_journey[:entry] != nil
    #!!@entry_station (means the same as above)
  end

private
def deduct(amount)
  @balance -= amount
end


end
