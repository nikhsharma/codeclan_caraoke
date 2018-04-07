require("minitest/autorun")
require("minitest/rg")

require_relative("../bar.rb")
require_relative("../guest.rb")
require_relative("../room.rb")

class TestBar < MiniTest::Test

  def setup
    @guest = Guest.new("Bob", 100, "")
    @bar = Bar.new()
    @room = Room.new([], @bar)
  end

  def test_bar_has_drinks()
    assert_equal([{drink: "beer", price: 3}, {drink: "wine", price: 4}, {drink: "spirit", price: 4}, {drink: "soft drink", price: 1} ], @bar.drinks)
  end

  def test_bar_can_sell_drink()
    assert_equal(3, @bar.sell_drink(@bar.drinks[0]))
  end


end
