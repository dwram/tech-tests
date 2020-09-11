# Items that are not Conjured, Aged, Sulfuras or Backstage
class GenericItem < Item

  def initialize(name, sell_in, quality)
    super(name, sell_in, quality)
  end

  def compute_update_quality
    @sell_in -= 1
    @quality -= 1 if @quality.positive?
    @quality -= 1 if @quality.positive? && @sell_in.negative?
  end

end
