require("minitest/autorun")
require("minitest/rg")

require_relative("../guest.rb")

class TestGuest < MiniTest::Test

  def setup()
    @guest = Guest.new("Guy")
  end

  def Guest_has_name()
    assert_equal("Guy", Guest.name)
  end

end
