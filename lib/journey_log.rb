require_relative 'journey'



class JourneyLog

attr_reader :journeys

  def initialize( journey_class: Journey )
    @journey_class = journey_class
    @journeys = []
  end

  def new_journey
    @journey_class.new
  end

end
