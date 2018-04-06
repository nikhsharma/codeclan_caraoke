class Guest

  attr_reader :name
  def initialize(name)
    @name = name
  end


  def play_song(song)
    song.play()
  end
end
