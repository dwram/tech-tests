require_relative './aged-brie'
require_relative './backstage-pass'
require_relative './sulfuras-hand-of-ragnaros'
require_relative './conjured-item'
require_relative './generic-item'
require_relative './gilded-rose'

# Item generator
class ItemFactory

  def self.create_item(name, sell_in, quality)
    case name
    when 'Aged Brie' then AgedBrie.new(sell_in, quality)
    when 'Backstage passes to a TAFKAL80ETC concert' then BackStagePass.new(sell_in, quality)
    when 'Sulfuras, Hand of Ragnaros' then Sulfuras.new(sell_in, quality)
    when 'Conjured Item' then ConjuredItem.new(sell_in, quality)
    else; GenericItem.new(name, sell_in, quality)
    end
  end

end