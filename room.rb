class Room

  attr_reader :songs, :guests

  def initialize(songs)
    @songs = songs
    @guests = []
  end

end
