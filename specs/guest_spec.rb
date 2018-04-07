require("minitest/autorun")
require("minitest/rg")

require_relative("../guest.rb")
require_relative("../room.rb")
require_relative("../song.rb")
require_relative("../bar.rb")
require_relative("../caraoke.rb")

class TestGuest < MiniTest::Test

  def setup()
    @song = Song.new("Test Song", "Dr. Test")
    @guest = Guest.new("Guy", 100, @song)
    @guest2 = Guest.new("Bob", 100, "song I like")
    @bar = Bar.new()
    @room = Room.new([@song], @bar)
    @venue = Caraoke.new([@room], @bar)
  end

  def test_guest_has_name()
    assert_equal("Guy", @guest.name)
  end

  def test_guest_has_money()
    assert_equal(100, @guest.money)
  end

  def test_guest_can_play_song_in_room()
    @room.check_in(@guest)
    assert_equal("Now playing: Dr. Test - Test Song", @guest.play_song(@room, @song))
  end

  def test_guest_can_pay__has_enough_money()
    @guest.pay(10)
    assert_equal(90, @guest.money)
  end

  def test_guest_can_pay__not_enough_money()
    @guest.pay(120)
    assert_equal(100, @guest.money)
  end

  def test_guest_has_favourite_song()
    assert_equal(@song, @guest.favourite_song)
  end

  def test_guest_sees_favourite_Song()
    assert_equal("Woo!", @guest.sees_favourite_song(@room.songs))
  end

  def test_guest_doesnt_see_favourite_song()
    assert_nil(@guest2.sees_favourite_song(@room.songs))
  end

  def test_guest_buys_drink()
    @room.check_in(@guest)
    @room.guests[0].buy(@room, @room.bar.drinks[0])
    @room.check_out(@room.guests[0])
    assert_equal(87, @guest.money)
  end

  def test_guest_can_enter_venue()
    @guest.enter_venue(@venue)
    assert_equal([@guest], @venue.guests)
  end

  def test_guest_can_check_into_room()
    @guest.enter_venue(@venue)
    @venue.guests[0].check_into_room(@venue, @venue.rooms[0])
    assert_equal(1, @venue.rooms[0].guests.count)
  end

end
