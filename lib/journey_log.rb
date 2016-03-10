require_relative 'journey'

class JourneyLog

attr_reader :journeys

  def initialize( journey_class: Journey )
    @journey_class = journey_class
    @journeys = []
  end

  def entry(station)
    new_journey
    current_journey.start(station)
  end

  def exit(station)
    journeys_array.entry_station.nil? ? new_journey.finish(station) : current_journey.finish(station)
  end

  def access_journeys
    @journeys.dup[-1]
  end

  private

  def current_journey
    journeys_array.complete? ? new_journey : journeys_array
  end

  def journeys_array
    @journeys[-1]
  end

  def new_journey
    @journeys << @journey_class.new
    access_journeys
  end

end
