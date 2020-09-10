class AgedBrie < Item
  def initialize(sell_in, quality)
    super('Aged Brie', sell_in, quality)
  end

  def compute_update_quality
    @sell_in -= 1
    @quality += 1 if @quality < 50
    @quality += 1 if @sell_in.negative? && @quality < 50
  end
end
