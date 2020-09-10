class ConjuredItem < Item
  def initialize(sell_in, quality)
    super('Conjured Item', sell_in, quality)
  end

  def compute_update_quality
    2.times do
      @sell_in -= 1
      @quality -= 1 if @quality.positive?
      @quality -= 1 if @quality.positive? && @sell_in.negative?
    end
  end

end
