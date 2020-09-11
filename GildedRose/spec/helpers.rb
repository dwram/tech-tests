def sulfuras_item(sell_in, quality, name = 'Sulfuras, Hand of Ragnaros')
  [ItemFactory.create_item(name, sell_in, quality)]
end

def aged_brie_item(sell_in, quality, name = 'Aged Brie')
  [ItemFactory.create_item(name, sell_in, quality)]
end

def backstage_item(sell_in, quality, name = 'Backstage passes to a TAFKAL80ETC concert')
  [ItemFactory.create_item(name, sell_in, quality)]
end

def conjured_item(sell_in, quality, name = 'Conjured Item')
  [ItemFactory.create_item(name, sell_in, quality)]
end

def item(sell_in, quality, name = 'foo')
  [ItemFactory.create_item(name, sell_in, quality)]
end