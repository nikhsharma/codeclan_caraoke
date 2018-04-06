class Room

  attr_reader :songs, :guests

  def initialize(songs)
    @songs = songs
    @guests = []
    @entry_fee = 10
  end

  def check_in(guest)
    @guests.push(guest) if @guests.count < 8
    guest.pay(@entry_fee)
    guest.sees_favourite_song(@songs)
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
