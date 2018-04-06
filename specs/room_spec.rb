require("minitest/autorun")
require("minitest/rg")

require_relative("../room.rb")
require_relative("../guest.rb")
require_relative("../song.rb")

class TestRoom < MiniTest::Test

  def setup()
    @guest1 = Guest.new("Guy")
    @guest2 = Guest.new("Bob")
    @guest3 = Guest.new("Dave")
    @guest4 = Guest.new("Sue")
    @guest5 = Guest.new("Paul")
    @guest6 = Guest.new("Emma")
    @guest7 = Guest.new("Tom")
    @guest8 = Guest.new("Kyle")
    @guest9 = Guest.new("Man")
    @guest10 = Guest.new("Zoo")
    @song1 = Song.new("Test Song", "Dr. Test")
    @song2 = Song.new("Testing, yo", "Test-o")
    @songs = [@song1]
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

  def test_room_can_add_song()
    @room.add_song(@song2)
    assert_equal([@song1, @song2], @room.songs)
  end

  def test_room_guest_limit()
    @room.check_in(@guest1)
    @room.check_in(@guest2)
    @room.check_in(@guest3)
    @room.check_in(@guest4)
    @room.check_in(@guest5)
    @room.check_in(@guest6)
    @room.check_in(@guest7)
    @room.check_in(@guest8)
    @room.check_in(@guest9)
    @room.check_in(@guest10)
    assert_equal(8, @room.guests.count)
  end

end
