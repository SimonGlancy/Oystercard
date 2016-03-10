require 'journey_log'

describe JourneyLog do
  subject(:journey_log) {described_class.new}

  describe '#initialize' do
    it '1.0 has a journeys method that initially returns an empty array' do

    expect(journey_log.journeys).to be_empty

    end
  end
  describe '#new_journey' do
    it '2.0 creates a new instance of the Journey Class' do

    expect(journey_log.new_journey).to be_an_instance_of Journey


    end
  end

end
