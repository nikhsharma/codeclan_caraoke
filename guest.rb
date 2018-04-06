class Guest

  attr_reader :name, :money, :favourite_song
  def initialize(name, money, favourite_song)
    @name = name
    @money = money
    @favourite_song = favourite_song
  end

  def play_song(room, song)
    room.play_song(song)
  end

  def pay(amount)
    @money -= amount if money >= amount
  end

  def sees_favourite_song(songs)
    if songs.include? @favourite_song
      return "Woo!"
    end
  end





end
