require("minitest/autorun")
require("minitest/rg")

require_relative("../room.rb")
require_relative("../guest.rb")
require_relative("../song.rb")
require_relative("../bar.rb")
require_relative("../caraoke.rb")

class TestRoom < MiniTest::Test

  def setup()
    @song1 = Song.new("Test Song", "Dr. Test")
    @song2 = Song.new("Testing, yo", "Test-o")
    @songs = [@song1]
    @bar = Bar.new()
    @room = Room.new(@songs, @bar)
    @venue = Caraoke.new([@room], @bar)
    @guest1 = Guest.new("Guy", 100, @song1)
    @guest2 = Guest.new("Bob", 70, @song2)
    @guest3 = Guest.new("Dave", 40, "")
    @guest4 = Guest.new("Sue", 30, "")
    @guest5 = Guest.new("Paul", 120, "")
    @guest6 = Guest.new("Emma", 30, "")
    @guest7 = Guest.new("Tom", 500, "")
    @guest8 = Guest.new("Kyle", 300, "")
    @guest9 = Guest.new("Man", 150, "")
    @guest10 = Guest.new("Zoo", 80, "")
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
    @room.check_out(@guest1, @venue)
    assert_equal([@guest2], @room.guests)
  end

  def test_guest_checks_out__goes_to_venue()
    @guest1.check_into_room(@venue, @room)
    @guest1.check_out_of_room(@room, @venue)
    assert_equal(1, @venue.guests.count)
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

  def test_room_can_play_song()
    assert_equal("Now playing: Dr. Test - Test Song", @room.play_song(@song1))
  end

  def test_entry_fee()
    @room.check_in(@guest2)
    assert_equal(10, @room.guests[0].tab)
  end

  def test_room_has_guests_favourite_song()
    assert_equal("Woo!", @room.check_in(@guest1))
  end

  def test_room_doesnt_have_guests_favourite_song()
    assert_nil(@room.check_in(@guest2))
  end

  def test_room_can_sell_drink_from_bar()
    @room.check_in(@guest1)
    @room.sell_drink(@room.guests[0], @room.bar.drinks[0])
    assert_equal(13, @room.guests[0].tab)
  end

  def test_spending_tab__before_drink()
    @room.check_in(@guest1)
    assert_equal([{guest: "Guy", tab: 10}], @room.guests_tab)
  end

  def test_guest_pays_tab_when_leaving()
    @room.check_in(@guest1)
    @room.sell_drink(@room.guests[0], @room.bar.drinks[0])
    @room.check_out(@room.guests[0], @venue)
    assert_equal(87, @guest1.money)
  end

  def test_tab__one_guest_one_drink()
    @room.check_in(@guest1)
    @room.sell_drink(@room.guests[0], @room.bar.drinks[0])
    assert_equal([{guest: @room.guests[0].name, tab: 13}], @room.guests_tab)
  end

  def test_tab__one_guest_two_drinks()
    @room.check_in(@guest1)
    @room.sell_drink(@room.guests[0], @room.bar.drinks[0])
    @room.sell_drink(@room.guests[0], @room.bar.drinks[1])
    assert_equal([{guest: @room.guests[0].name, tab: 17}], @room.guests_tab)
  end

  def test_tab__two_guest_two_drinks()
    @room.check_in(@guest1)
    @room.check_in(@guest2)
    @room.sell_drink(@room.guests[0], @room.bar.drinks[0])
    @room.sell_drink(@room.guests[0], @room.bar.drinks[2])
    @room.sell_drink(@room.guests[1], @room.bar.drinks[0])
    @room.sell_drink(@room.guests[1], @room.bar.drinks[0])
    assert_equal([{guest: @room.guests[0].name, tab: 17}, {guest: @room.guests[1].name, tab: 16}], @room.guests_tab)
  end

  def test_room_doesnt_allow_entry__not_enough_money()
    @guest1.enter_venue(@venue)
    @guest1.pay(95)
    @guest1.check_into_room(@venue, @venue.rooms[0])
    assert_equal(0, @venue.rooms[0].guests.count)
    assert_equal(1, @venue.guests.count)
  end

  def test_room_wont_sell_drink__not_enough_money()
    @room.check_in(@guest1)
    @guest1.pay(89)
    @guest1.buy(@room, @room.bar.drinks[0])
    assert_equal(11, @guest1.money)
    assert_equal(10, @room.guests[0].tab)
    assert_equal(1, @guest1.remaining_cash)

  end

end
