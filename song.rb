class Song

  attr_reader :title, :artist

  def initialize(title, artist)
    @title = title
    @artist = artist
  end

  def play()
    return "Now playing: #{@artist} - #{@title}"
  end

end
