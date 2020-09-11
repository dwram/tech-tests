class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def compute_update_quality
    @sell_in -= 1
    @quality -= 1 if @quality.positive?
    @quality -= 1 if @quality.positive? && @sell_in.negative?
  end

  def to_s
    "#{@name}, #{@sell_in}, #{@quality}"
  end

end