require 'journey'

describe Journey do

  min_fare = Journey::MIN_FARE
  penalty_fare = Journey::PENALTY_FARE

  subject(:journey) { described_class.new }
  let(:entry_station) { double(:station) }
  let(:exit_station) { double(:station) }
  # let(:valid_log) { {entry: entry_station, exit: exit_station} }
  # let(:no_entry_log) { {exit: exit_station} }
  # let(:no_exit_log) { {entry: entry_station}}

  describe '#initialize' do
    it '1.0 initializes with entry_station nil' do
      expect(journey.entry_station).to be nil
    end

    it '1.1 initializes with exit_station nil' do
      expect(journey.exit_station).to be nil
    end

  end

  describe '#start' do
    it '2.0 logs entry station' do
      journey.start(entry_station)
      expect(journey.entry_station).to eq(entry_station)
    end
  end

  describe '#finish' do
    it '3.0 logs exit station' do
      journey.finish(exit_station)
      expect(journey.exit_station).to eq(exit_station)
    end
  end

  describe '#fare' do
    it '4.0 returns a minimal fare for complete journey' do
      journey.start(entry_station)
      journey.finish(exit_station)
      expect(journey.fare).to eq min_fare
    end
<<<<<<< HEAD
    it 'returns a penalty fare for invalid touch-in' do
      journey.finish(exit_station)
      expect(journey.fare).to eq penalty_fare
    end
    it 'returns a penalty fare for invalid touch-out' do
=======
    it '4.1 returns a penalty fare for invalid touch-out' do
>>>>>>> e1beb01d89a6baa41468e9fa010741a0c896f2b0
      journey.finish(exit_station)
      expect(journey.fare).to eq penalty_fare
    end
  end
end
