require 'oystercard'

describe Oystercard do

  default_balance = Oystercard::DEFAULT_BALANCE
  max_balance = Oystercard::MAX_BALANCE
  min_balance = Oystercard::MIN_BALANCE

  subject(:card) { described_class.new }
  let(:entry_station) { double(:station) }
  let(:exit_station) { double(:station) }
  let(:journey) { double(:journey) }

  describe '#initialize' do
    it '1.0 initializes with a default balance' do
      expect(card.balance).to eq(default_balance)
    end
  end

  describe '#top_up' do
    it '2.0 increases balance by a given amount' do
      amount = rand(10..50)
      expect{card.top_up(amount)}.to change{card.balance}.by(amount)
    end
    it '2.1 raises an error when trying to top_up above max balance' do
      amount = rand((max_balance - card.balance + 1)..100)
      message = "Balance cannot exceed £#{max_balance}"
      expect{card.top_up(amount)}.to raise_error message
    end
  end

  describe '#touch_in' do
    it '3.0 raises an error when balance is below min balance' do
      message = "Need at least £#{min_balance} to touch in"
      expect{card.touch_in(entry_station)}.to raise_error message
    end
  end

  describe '#touch_out' do
    before(:each) do
      card.top_up(10)
      card.touch_in(entry_station)
      card.touch_out(exit_station)
    end
    it '4.1 completes a journey' do
      expect(card.journey_log_class.journeys[-1].complete?).to eq(true)
    end
    it '4.2 updates an exit station' do
      expect(card.journey_log_class.journeys[-1].exit_station).to eq(exit_station)
    end
  end
end
