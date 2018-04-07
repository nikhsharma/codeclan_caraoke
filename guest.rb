class Guest

  attr_reader :name, :money, :favourite_song, :tab
  def initialize(name, money, favourite_song)
    @name = name
    @money = money
    @tab = 0
    @favourite_song = favourite_song
  end

  def play_song(room, song)
    room.play_song(song)
  end

  def pay(amount)
    @money -= amount if money >= amount
    @tab += amount
  end

  def sees_favourite_song(songs)
    if songs.include? @favourite_song
      return "Woo!"
    end
  end

  def buy(room, drink)
    room.sell_drink(self, drink)
  end




end
