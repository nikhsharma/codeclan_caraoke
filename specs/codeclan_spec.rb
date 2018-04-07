require("minitest/autorun")
require("minitest/rg")

require_relative("../codeclan_caraoke.rb")
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
    @caraoke_venue = Caraoke.new(@rooms, @bar)
    @guest1 = Guest.new("Bob", 50, @song1)
    @guest2 = Guest.new("Barb", 50, @song2)
    @guest3 = Guest.new("Brenda", 50, @song3)
    @gues4 = Guest.new("Ben", 50, @song4)
  end




end
