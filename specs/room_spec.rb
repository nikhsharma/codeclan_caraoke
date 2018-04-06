require("minitest/autorun")
require("minitest/rg")

require_relative("../room.rb")
require_relative("../guest.rb")
require_relative("../song.rb")

class TestRoom < MiniTest::Test

  def setup()
    @guest1 = Guest.new("Guy")
    @guest2 = Guest.new("Bob")
    song1 = Song.new("Test Song", "Dr. Test")
    song2 = Song.new("Testing, yo", "Test-o")
    @songs = [song1, song2]
    @room = Room.new(@songs)
  end

  def test_room_has_songs()
    assert_equal(@songs, @room.songs)
  end

  def test_room_is_empty()
    assert_equal([], @room.guests)
  end

  def test_room_has_one_guest()
    @room.check_in(@guest1)
    assert_equal([@guest1], @room.guests)
  end

  def test_room_has_two_guests()
    @room.check_in(@guest1)
    @room.check_in(@guest2)
    assert_equal([@guest1, @guest2], @room.guests)
  end

  def test_room_can_check_guest_out()
    @room.check_in(@guest1)
    @room.check_in(@guest2)
    @room.check_out(@guest1)
    assert_equal([@guest2], @room.guests)
  end

end
