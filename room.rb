class Room

  attr_reader :songs, :guests

  def initialize(songs)
    @songs = songs
    @guests = []
  end

  def check_in(guest)
    if @guests.count < 8
      @guests.push(guest)
    end
  end

  def check_out(guest)
    @guests.delete(guest)
  end

  def add_song(song)
    @songs.push(song)
  end

  def play_song(song)
    return song.play
  end



end
