require_relative 'journey'

class Oystercard

  DEFAULT_BALANCE = 0
  MAX_BALANCE = 90
  MIN_BALANCE = 1
  MIN_FARE = 1
  MESSAGE1 = "Balance cannot exceed £#{MAX_BALANCE}"
  MESSAGE2 = "Need at least £#{MIN_BALANCE} to touch in"

  attr_reader :balance, :journeys

  def initialize(journey_class: Journey)
    @journey_class = journey_class
    @balance = DEFAULT_BALANCE
    @journeys = []
  end

  def top_up(amount)
    raise MESSAGE1 if @balance + amount > MAX_BALANCE
    @balance += amount
  end

  def touch_in(station)
    raise MESSAGE2 if balance < MIN_BALANCE
    @journeys << @journey_class.new
    @journeys[-1].start(station)
  end

  def touch_out(station)
    @exit_station = station
    @journeys[-1].finish(station)
    deduct(@journeys[-1].fare)
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
