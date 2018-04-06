require("minitest/autorun")
require("minitest/rg")

require_relative("../bar.rb")

class TestBar < MiniTest::Test

  def setup
    @bar = Bar.new()
  end

  def test_bar_has_drinks()
    assert_equal([{drink: "beer", price: 3},{drink: "soft drink", price: 1}], @bar.drinks)
  end

end
