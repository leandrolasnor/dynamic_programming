require './bag_items.rb'

RSpec.describe BagItems do
  let(:items) do
    [
      Item.new(weight: 1, profit: 1),
      Item.new(weight: 3, profit: 5),
      Item.new(weight: 5, profit: 8),
      Item.new(weight: 8, profit: 10)
    ]
  end

  context 'on initializer' do
    context 'when items param is a empty array' do
      let(:bag_items) { described_class.new(backpack: Backpack.new(size: 11)) }
      let(:error_message) { 'Items must be a list with size high than zero.' }

      it 'must to raise a error' do
        expect { bag_items }.to raise_error(StandardError, error_message)
      end
    end
  end

  context 'on Success' do
    context 'when backpack size is 11' do
      let(:size) { 11 }
      let(:full_backpack) { described_class.call(backpack: Backpack.new(size: size), items: items) }

      it 'must to return a full backpack' do
        expect(full_backpack.items.size).to eq(2)
        expect(full_backpack.items[0].weight).to eq(8)
        expect(full_backpack.items[0].profit).to eq(10)
        expect(full_backpack.items[1].weight).to eq(3)
        expect(full_backpack.items[1].profit).to eq(5)
      end
    end

    context 'when backpack size is 10' do
      let(:size) { 10 }
      let(:full_backpack) { described_class.call(backpack: Backpack.new(size: size), items: items) }

      it 'must to return a full backpack' do
        expect(full_backpack.items.size).to eq(3)
        expect(full_backpack.items[0].weight).to eq(5)
        expect(full_backpack.items[0].profit).to eq(8)
        expect(full_backpack.items[1].weight).to eq(3)
        expect(full_backpack.items[1].profit).to eq(5)
        expect(full_backpack.items[2].weight).to eq(1)
        expect(full_backpack.items[2].profit).to eq(1)
      end
    end
  end
end