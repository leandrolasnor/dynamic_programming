require './backpack.rb'

RSpec.describe Backpack do
  context 'on initializer' do
    context 'when backpack have a size less than or equal to zero' do
      let(:error_message) { 'Backpack must have a size high than zero.' }

      it 'must to raise a error' do
        expect { described_class.new }.to raise_error(StandardError, error_message)
      end
    end

    context 'when backpack have a size high than zero' do
      let(:backpack) { described_class.new(size: 11) }

      it 'must be possible to access your attributes' do
        expect(backpack.size).to eq(11)
        expect(backpack.items).to eq([])
      end
    end
  end
end