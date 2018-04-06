class Room

  attr_reader :songs, :guests

  def initialize(songs)
    @songs = songs
    @guests = []
  end

  def check_in(guest)
    @guests.push(guest)
  end

  def check_out(guest)
    @guests.delete(guest)
  end

end
