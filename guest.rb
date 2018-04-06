class Guest

  attr_reader :name, :money
  def initialize(name, money)
    @name = name
    @money = money
  end

  def play_song(room, song)
    room.play_song(song)
  end

end
