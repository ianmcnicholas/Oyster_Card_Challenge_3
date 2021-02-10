class Journey

=begin
Has to store information regarding entry and exit stations.
These stations must have data on their zone.
Is a journey complete or incomplete?  @in_use for example.
on touch in you will check to see if there is already an open journey
if there is already an open journey, it gets closed, and a new journey starts.

Needs to be able to calculate the fare of a journey.

=end

attr_reader :entry_station, :exit_station

def initialize(entry_station)
  @entry_station = entry_station
  @exit_station = nil
end


end
