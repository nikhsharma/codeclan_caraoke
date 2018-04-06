require("minitest/autorun")
require("minitest/rg")

require_relative("../guest.rb")

class TestGuest < MiniTest::Test

  def setup()
    @guest = Guest.new("Guy")
  end

  def test_guest_has_name()
    assert_equal("Guy", @guest.name)
  end

end
