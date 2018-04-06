require("minitest/autorun")
require("minitest/rg")

require_relative("../guest.rb")
require_relative("../room.rb")
require_relative("../song.rb")

class TestGuest < MiniTest::Test

  def setup()
    @guest = Guest.new("Guy")
    @song = Song.new("Test Song", "Dr. Test")
    @room = Room.new([@song])
  end

  def test_guest_has_name()
    assert_equal("Guy", @guest.name)
  end

  def test_guest_can_play_song_in_room()
    @room.check_in(@guest)
    assert_equal("Now playing: Dr. Test - Test Song", @guest.play_song(@room, @song))
  end

end
