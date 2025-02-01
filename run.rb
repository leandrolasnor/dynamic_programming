require './bag_items.rb'

items = []
items << Item.new(weight: 0, profit: 0)
items << Item.new(weight: 1, profit: 1)
items << Item.new(weight: 3, profit: 5)
items << Item.new(weight: 5, profit: 8)
items << Item.new(weight: 8, profit: 10)
backpack = BagItems.call(backpack: Backpack.new(size: 11), items: items)
puts ""
puts "Backpack Size: #{backpack.size}"
puts Terminal::Table.new :title => "ITEMS", headings: %w(Weight Profit), rows: backpack.items.map { [_1.weight, _1.profit] }
puts "Max Profit: #{backpack.items.sum(&:profit)}"
puts ""