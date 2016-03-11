
require 'journey'


describe Journey do

  subject(:journey) { described_class.new }
  let(:entry_station) { double(:station) }
  let(:exit_station) { double(:station2) }


  context 'initialization' do
    describe '#initialize' do
      it '1.0 entry_station is nil' do
        expect(journey.entry_station).to be nil
      end

      it '1.1 exit_station is nil' do
        expect(journey.exit_station).to be nil
      end

    end
  end

  context 'start a journey' do
    describe '#start_journey' do
      it '2.0 adds the entry station' do
        journey.start(entry_station)
        expect(journey.entry_station).to be entry_station
      end
    end
  end

  context 'end a journey' do
    describe '#end_journey' do
      it '3.0 adds the exit station' do
        journey.end(exit_station)
        expect(journey.exit_station).to be exit_station
      end
    end
  end

  context 'is the journey complete' do
    describe '#complete?' do
      it '4.0 returns true when start and end have been called' do
        journey.start(entry_station)
        journey.end(exit_station)
        expect(journey.complete?).to be true
      end
    end
  end



end
