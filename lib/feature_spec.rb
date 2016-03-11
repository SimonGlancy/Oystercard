require_relative 'journey'
require_relative 'oystercard'
require_relative 'station'

card = Oystercard.new
station1 = Station.new("Shoreditch", 1)
station2 = Station.new("Hoxton", 7)
journey = Journey.new

p card
p station1
p station2
p journey
card.top_up(50)
card.touch_in(station1)

p card

p card.journeys[-1].complete?
