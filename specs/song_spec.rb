require("minitest/autorun")
require("minitest/rg")

require_relative("../song.rb")

class TestSong < MiniTest::Test


  def setup()
    @song = Song.new("Test Song", "Dr. Test")
  end

  def test_song_has_title()
    assert_equal("Test Song", @song.title())
  end

  def test_song_has_artist()
    assert_equal("Dr. Test", @song.artist())
  end

  def test_song_can_play()
    assert_equal("Now playing: Dr. Test - Test Song", @song.play)
  end
end
