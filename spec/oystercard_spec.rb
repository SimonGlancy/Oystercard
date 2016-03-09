require 'oystercard'

describe Oystercard do
  default_balance = Oystercard::DEFAULT_BALANCE
  max_balance = Oystercard::MAX_BALANCE
  min_balance = Oystercard::MIN_BALANCE
  min_fare = Oystercard::MIN_FARE

subject(:card) { described_class.new }
let(:entry_station) { double(:station) }
let(:exit_station) { double(:station) }
let(:journey) { {entry: entry_station, exit: exit_station} }

  describe '#initialize' do
    it 'initializes with a default balance' do
      expect(card.balance).to eq(default_balance)
    end
    it 'initializes with journeys = []' do
      expect(card.journeys).to eq([])
    end
  end

  describe '#top_up' do
    it 'increases balance by a given amount' do
      amount = rand(10..50)
      expect{card.top_up(amount)}.to change{card.balance}.by(amount)
    end
    it 'raises an error when trying to top_up above max balance' do
      amount = rand((max_balance - card.balance + 1)..100)
      message = "Balance cannot exceed £#{max_balance}"
      expect{card.top_up(amount)}.to raise_error message
    end
  end

  describe '#touch_in' do
    it 'raises an error when balance is below min balance' do
      message = "Need at least £#{min_balance} to touch in"
      expect{card.touch_in(entry_station)}.to raise_error message
    end
    context 'when card is in_journey' do
      before(:each) do
        card.top_up(10)
        card.touch_in(entry_station)
      end
      it 'changes in_journey to false' do
        expect(card.in_journey?).to eq(true)
      end
      it 'records entry_station' do
        expect(card.journeys[-1][:entry]).to eq entry_station
      end
    end
  end

  describe '#touch_out' do
    before(:each) do
      card.top_up(10)
      card.touch_in(entry_station)
      card.touch_out(exit_station)
    end
    it 'remembers exit_station' do
      expect(card.journeys[-1][:exit]).to eq(exit_station)
    end
    it 'stores a journey to journeys' do
      expect(card.journeys).to include journey
    end
    it 'changes in_journey to false' do
      expect(card.in_journey?).to eq(false)
    end
    it 'deducts minimum fare' do
      expect(card.balance).to eq 10 - min_fare
    end
  end
end
