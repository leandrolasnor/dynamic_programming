class Item
  attr_reader :weight, :profit
  def initialize(weight: 0, profit: 0)
    @weight = weight.to_i
    @profit = profit.to_i
  end
end