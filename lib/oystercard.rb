class Oystercard

  DEFAULT_BALANCE = 0
  MAX_BALANCE = 90
  MIN_BALANCE = 1
  MIN_FARE = 1

  attr_reader :balance, :journeys

  def initialize
    @balance = DEFAULT_BALANCE
    @journeys = []
  end

  def top_up(amount)
    message = "Balance cannot exceed £#{MAX_BALANCE}"
    raise message if @balance + amount > MAX_BALANCE
    @balance += amount
  end

  def touch_in(station)
    message = "Need at least £#{MIN_BALANCE} to touch in"
    raise message if balance < MIN_BALANCE
    @journeys << {entry: station}
  end

  def touch_out(station)
    @exit_station = station
    @journeys[-1][:exit] = station
    deduct(MIN_FARE)
  end

  def in_journey?
    @journeys[-1].nil? || @journeys[-1].keys.include?(:entry && :exit) ? false : true
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
