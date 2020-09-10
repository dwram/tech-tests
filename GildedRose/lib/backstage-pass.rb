class BackStagePass < Item
  def initialize(sell_in, quality)
    super('Backstage passes to a TAFKAL80ETC concert', sell_in, quality)
  end

  def compute_update_quality
    if @quality < 50
      @quality += 1
      @quality += 1 if @sell_in < 6 && @quality < 50
      @quality += 1 if @sell_in < 11 && @quality < 50
    end
    @sell_in -= 1
    @quality = 0 if @sell_in.negative?
  end

end