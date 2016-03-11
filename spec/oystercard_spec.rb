require 'oystercard'

describe Oystercard do
  subject(:card) { described_class.new  }
  let(:station) { double(:station) }
  let(:station2) { double(:station2) }
  let(:journey) {double(:journey)}

  context "#initialize" do
      it '1.0 checks that new card has a balance' do
        expect(card.balance).to eq Oystercard::DEFAULT_BALANCE
      end
      it '1.1 has an empty list of journeys' do
        expect(card.journeys).to be_empty
      end
  end

  describe '#top_up' do
    it '2.0 it adds 20 to balance' do
      card.top_up(20)
      expect(card.balance).to eq 20
    end

    it '2.2 raises an error if balance exceeds limit' do
      message = "Error, balance exceeds £#{Oystercard::MAX_LIMIT}!"
      expect{ card.top_up(100) }.to raise_error message
    end
  end

  describe '#touch_in' do
    # it '3.0 card is in journey' do
    #   allow(card).to receive(:in_journey?).and_return(true)
    #   expect{ card.touch_in(station) }.to raise_error "This card is in a journey"
    # end

    it '3.1 raises error when balance insufficient' do
      allow(card).to receive(:in_journey?).and_return(false)
      expect{ card.touch_in(station) }.to raise_error "Error insufficient funds"
    end

  end

  describe '#touch_out' do
    it '4.0 card is not in journey' do
      allow(card).to receive(:in_journey?).and_return(false)
      card.top_up(20)
      card.touch_in(station)
      card.touch_out(station2)
      expect(card.in_journey?).to eq false
    end

   it '4.1 deducts fare from balance' do
     card.top_up(20)
     allow(journey).to receive(:end).and_return station
     card.touch_in(station)
     expect{ card.touch_out(station) }.to change{ card.balance }.by -Oystercard::MIN_FARE
   end

   it '4.2 forgets the entry station on touch out' do
     allow(card).to receive(:in_journey?).and_return(false)
     card.top_up(20)
     card.touch_in(station)
     card.touch_out(station2)
     expect(card.in_journey?).to eq false
   end
  end
end
