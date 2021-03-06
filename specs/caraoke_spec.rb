require("minitest/autorun")
require("minitest/rg")

require_relative("../caraoke.rb")
require_relative("../bar.rb")
require_relative("../room.rb")
require_relative("../guest.rb")
require_relative("../song.rb")


class TestCaraoke < MiniTest::Test


  def setup()
    @song1 = Song.new("Test Song", "Dr. Test")
    @song2 = Song.new("Testing, yo", "Test-o")
    @songs1 = [@song1, @song2]
    @song3 = Song.new("Trying Stuff", "Will-it-work")
    @song4 = Song.new("Another Song", "Dr. Test")
    @songs2 = [@song3, @song4]
    @bar = Bar.new()
    @room1 = Room.new(@songs1, @bar)
    @room2 = Room.new(@songs2, @bar)
    @rooms = [@room1, @room2]
    @venue = Caraoke.new(@rooms, @bar)
    @guest1 = Guest.new("Bob", 50, @song1)
    @guest2 = Guest.new("Barb", 50, @song2)
    @guest3 = Guest.new("Brenda", 50, @song3)
    @guest4 = Guest.new("Ben", 50, @song4)
  end

  def test_venue_has_rooms()
    assert_equal(@rooms, @venue.rooms)
  end

  def test_venue_has_a_bar()
    assert_equal(@bar, @venue.bar)
  end

  def test_venue_is_empty()
    assert_equal([], @venue.guests)
  end

  def test_venue_has_a_guest()
    @guest1.enter_venue(@venue)
    assert_equal([@guest1], @venue.guests)
  end

  def test_check_guest_into_room()
    @guest1.enter_venue(@venue)
    @venue.check_into_room(@venue.rooms[0], @venue.guests[0])
    assert_equal(1, @venue.rooms[0].guests.count)
  end

  def test_guest_can_buy_drink_from_venue_bar()
    @guest1.enter_venue(@venue)
    @venue.sells_drink(@venue.guests[0], @venue.bar.drinks[0])
    assert_equal(47, @venue.guests[0].money)
  end

  def test_venue_wont_sell_drink__not_enough_money()
    @guest1.enter_venue(@venue)
    @guest1.pay(49)
    @venue.sells_drink(@venue.guests[0], @venue.bar.drinks[0])
    assert_equal(1, @guest1.remaining_cash)
    assert_equal(1, @guest1.money)
  end

  def test_search_guest_by_name()
    @venue.guest_enters(@guest1)
    assert_equal(@guest1, @venue.search_guests("Bob"))
  end

  def test_search_rooms()
    assert_equal(@room1, @venue.search_rooms(@room1))
  end

end
