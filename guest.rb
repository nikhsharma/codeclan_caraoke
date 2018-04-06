class Guest

  attr_reader :name
  def initialize(name)
    @name = name
  end


  def play_song(room, song)
    room.play_song(song)
  end
end
