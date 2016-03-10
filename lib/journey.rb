class Journey

  MIN_FARE = 1
  PENALTY_FARE = 6
  attr_reader :log

  def initialize
    @log = {}
  end

  def start(entry_station)
    @log[:entry] = entry_station
  end

  def finish(exit_station)
    @log[:exit] = exit_station
  end

  def fare
    @log.keys == [:entry, :exit]? MIN_FARE : PENALTY_FARE
  end
end
