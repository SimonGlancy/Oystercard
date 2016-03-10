require_relative 'station'

class Journey

  MIN_FARE = 1
  PENALTY_FARE = 6
  attr_reader :entry_station, :exit_station

  def initialize
    @entry_station = nil
    @exit_station = nil
  end

  def start(entry_station)
    @entry_station = entry_station
  end

  def finish(exit_station)
    @exit_station= exit_station
  end

  def fare
    complete? ? fare_calc : PENALTY_FARE
  end

  def complete?
    !!@entry_station && !!@exit_station
  end

  private

  def zones_crossed
    (@exit_station.zone - @entry_station.zone).abs
  end

  def fare_calc
    MIN_FARE + zones_crossed
  end

end
