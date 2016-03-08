require 'oystercard'

describe Oystercard do
  let(:oystercard) {described_class.new}

  describe "#balance" do
    it "1.0 has a balance of £0" do
      expect( oystercard.balance).to eq 0
    end
  end

  describe "#top_up" do
    it "2.0 tops up the balance by £20" do
      oystercard.top_up(20)
      expect(oystercard.balance).to eq 20
    end

    it '2.1 raises error if balance exceeds £90' do
      limit = Oystercard::MAX_BALANCE
      message = "Limit is £#{limit}"
      expect{oystercard.top_up(91)}.to raise_error message
    end
  end

  describe '#debit' do
    it '3.0 reduce balance by £5' do
      oystercard.top_up(20)
      oystercard.debit(5)
      expect(oystercard.balance).to eq 15
    end
  end

  describe '#in_journey?' do
    it '4.0 is not in journey until tapped in' do
      expect(oystercard.in_journey).to be false
    end
  end
end
