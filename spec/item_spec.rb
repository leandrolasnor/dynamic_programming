require './item.rb'

RSpec.describe Item do
  context 'on initializer' do
    context 'when item is nil' do
      let(:item_nil) { described_class.new }

      it 'must to create a item nil' do
        expect(item_nil.weight).to eq(0)
        expect(item_nil.profit).to eq(0)
      end
    end

    context 'when item is not nil' do
      let(:item) { described_class.new(weight: 2, profit: 8) }

      it 'must to create a item' do
        expect(item.weight).to eq(2)
        expect(item.profit).to eq(8)
      end
    end
  end
end