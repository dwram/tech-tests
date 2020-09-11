<h3>Gilded Rose legacy code refactoring and feature upgrade</h3> 

<img src="https://i.gyazo.com/b1c42413723e4c0d429aa02ef5a207e9.png" alt="Gilded Rose"/>

nb: You may also use `ItemFactory.create_item(string ITEMNAME, int SELLIN, int QUALITY)` to create an item.
- This tech test required comprehensive testing suite design and implementation, mutation testing and use of polymorphism.

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

**Test suite justification:**<br/>
In order to create a "single source of all truth" in reference to the original legacy code, therefore enabling separation of original functions (and their tests) from future functions (and _their_ tests),
original legacy code tests were placed in a singular test suite. 

When creating the legacy code test suite, while full coverage was observed, mutations to portions of code did **NOT** consequently fail currently existing tests. 
This meant that conditional branches existed, that were not being tested.
Resultantly, the test suite was not comprehensive and changes to code with the current test suite may not catch bugs or unintended side-effects.
Thus in order to have true test coverage for all application logic, I opted to test every possible conditional in the legacy code.

This was the general ideology of my testing approach: 

```ruby
qualities.each do |quality|
  sell_ins.each do |sell_in|
    items.each do |item|
      tests_to_run = item.new(quality, sell_in)
    end
  end
end
```

Qualities and sell_in numerics were determined by legacy code conditionals.

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


Detailed commit log is found at alternative repo: https://github.com/dwram/GildedRose-Refactoring-Kata
