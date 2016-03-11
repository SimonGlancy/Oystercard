require 'station'
describe Station do

  subject { described_class.new("name", 1) }

  context 'initialization of class Station' do
    describe '#initialize' do
      it '1.0 exposed the station name' do
        expect(subject.name).to eq "name"
      end
      it '1.1 exposed the station zone' do
        expect(subject.zone).to eq 1
      end
    end
  end
end
