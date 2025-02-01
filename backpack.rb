class Backpack
  attr_reader :size, :items
  def initialize(size: 0)
    raise StandardError.new('Backpack must have a size high than zero.') unless size.to_i.positive?
    @size = size.to_i
    @items = []
  end
end