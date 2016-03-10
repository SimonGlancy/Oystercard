require_relative 'journey'

station1 = Station.new('holborn')
station2 = Station.new('algate')

p station1
p station2

journey = Journey.new
p journey.fare
journey.start(station1)
p journey.complete? 
p journey.fare
journey.finish(station2)
p journey.fare

p journey.complete?
