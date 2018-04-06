require("minitest/autorun")
require("minitest/rg")

require_relative("../song.rb")

class TestSong < MiniTest::Test


  def setup()
    @song = Song.new("Test Song", "Dr. Test")
  end

  def test_song_has_title
    assert_equal("Test Song", @song.title())
  end

end
