require 'journey'

describe Journey do

  min_fare = Journey::MIN_FARE
  penalty_fare = Journey::PENALTY_FARE

  subject(:journey) { described_class.new }
  let(:entry_station) { double(:station) }
  let(:exit_station) { double(:station) }
  let(:valid_log) { {entry: entry_station, exit: exit_station} }
  let(:no_entry_log) { {exit: exit_station} }
  let(:no_exit_log) { {entry: entry_station}}

  describe '#iniialize' do
    it 'initializes with log = {}' do
      expect(journey.log).to eq({})
    end
  end

  describe '#start' do
    it 'logs entry station' do
      journey.start(entry_station)
      expect(journey.log[:entry]).to eq(entry_station)
    end
  end

  describe '#finish' do
    it 'logs exit station' do
      journey.finish(exit_station)
      expect(journey.log[:exit]).to eq(exit_station)
    end
  end

  describe '#fare' do
    it 'returns a minimal fare for complete journey' do
      journey.start(entry_station)
      journey.finish(exit_station)
      expect(journey.fare).to eq min_fare
    end
    it 'returns a penalty fare for invalid touch-out' do
      journey.finish(exit_station)
      expect(journey.fare).to eq penalty_fare
    end
  end
end
