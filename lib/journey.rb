
class Journey
MIN_FARE = 1
PENALY_FARE = 6

  attr_reader :entry_station, :exit_station

  def initialize
    @entry_station = nil
    @exit_station = nil
  end

  def start(at)
    @entry_station = at
  end

  def end(at)
    @exit_station = at
  end

  def complete?
   !!@entry_station && !!@exit_station
  end

  def fare
    complete? ? MIN_FARE : PENALY_FARE
  end
end
