require './backpack.rb'
require './item.rb'
require 'terminal-table'

class BagItems
  def self.call(...) new(...).call end;
  def call
    build_matrix
    draw_matrix
    put_items_on_backpack
    backpack
  end

  private

  attr_reader :backpack, :items, :matrix
  def initialize(backpack: Backpack.new, items: [])
    raise StandardError.new('Items must have a list with size high than zero.') unless items.size.positive?
    @backpack = backpack
    @items = items.sort_by!(&:weight)
    @matrix = Array.new(items.size, 0)
    @matrix.each_with_index { @matrix[_2] = Array.new(backpack.size + 1, 0) }
  end

  def build_matrix
    for i in 1...matrix.length do
      for j in 1...matrix[i].length do
        if weight_low_capacity?(i,j) && profit(i,j) < sum_profits(i,j)
          matrix[i][j] = sum_profits(i,j)
        else
          matrix[i][j] = profit(i,j)
        end
      end
    end
  end

  def draw_matrix
    puts Terminal::Table.new :title => "MATRIX", :rows => matrix
  end

  def put_items_on_backpack
    j = matrix.first.length - 1
    for i in (1...matrix.length).to_a.reverse do
      if matrix[i][j] > matrix[i - 1][j]
        backpack.items << items[i]
        j = diff_capacity_weight(i,j)
      end
      i -= 1
    end
  end

  def backpack_capacity(j) return(j) end;
  def profit(i,j) matrix[i - 1][j] end;
  def diff_capacity_weight(i,j) backpack_capacity(j) - items[i].weight end;
  def weight_low_capacity?(i,j) items[i].weight <= backpack_capacity(j) end;
  def sum_profits(i,j) items[i].profit + matrix[i - 1][diff_capacity_weight(i,j)] end;
end