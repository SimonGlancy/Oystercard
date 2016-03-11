class Oystercard
  attr_reader :balance,  :journeys

  MAX_LIMIT = 90
  MIN_LIMIT = 1
  DEFAULT_BALANCE = 0
  ERROR = "Error, balance exceeds £#{MAX_LIMIT}!"
  ERROR1 = "This card is in a journey"
  ERROR2 = "Error insufficient funds"

  def initialize
    @balance = DEFAULT_BALANCE
    @journeys = []
  end

  def top_up(amount)
    raise ERROR if (@balance + amount) > MAX_LIMIT
    @balance += amount
  end

  def in_journey?
    !@journeys[-1].complete?
  end

  def touch_in(station)
    raise ERROR2 if @balance < MIN_LIMIT
    @journeys << Journey.new
    @journeys[-1].start(station)
  end

  def touch_out(station)
    @journeys[-1].end(station)
    deduct(@journeys[-1].fare)
  end

  private

  def deduct(fare)
    @balance -= fare
  end

end
