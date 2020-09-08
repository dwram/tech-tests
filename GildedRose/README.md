<h3>Gilded Rose legacy code refactoring and feature upgrade</h3> 

<img src="https://i.gyazo.com/b1c42413723e4c0d429aa02ef5a207e9.png" alt="Gilded Rose"/>
Required comprehensive testing suite design and implementation, mutation testing and use of polymorphism.

<h5>Runs in IRB/Pry. <br/> Require the file in the shell environment.</h5>


**To begin:**
- At project root execute `bundle install`
- Shell environments that can be used include 'irb'
- At tech_test root `irb -I ./GildedRose/lib ` to load the lib folder to Ruby's load path
- At project root `irb -I ./lib`

Once in the shell
- `require 'item-interface'` to load the item superclass
- `require 'items'` to load in item subclasses and GildedRose

- Use `instance = GildedRose.new([ITEM(S)]` syntax and `instance.update_quality` to use the program!
- Items take two parameters, `ItemName.new(SELL_IN, QUALITY)`.
<br/> NB: Pass the item(s) within an array to the GildedRose constructor.

**To run tests:**
- Execute command `rspec` at project root

**Acceptance criteria**

- All items have a SellIn value which denotes the number of days we have to sell the item
- All items have a Quality value which denotes how valuable the item is
- At the end of each day our system lowers both values for every item
- Once the sell by date has passed, Quality degrades twice as fast
- The Quality of an item is never negative
- "Aged Brie" actually increases in Quality the older it gets
- The Quality of an item is never more than 50
- "Sulfuras", being a legendary item, never has to be sold or decreases in Quality
- "Backstage passes", like aged brie, increases in Quality as its SellIn value approaches;
- Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but
- Quality drops to 0 after the concert
- We have recently signed a supplier of conjured items. This requires an update to our system:
	- "Conjured" items degrade in Quality twice as fast as normal items

Further information of requirements can be found at: https://github.com/emilybache/GildedRose-Refactoring-Kata/blob/master/GildedRoseRequirements.txt

