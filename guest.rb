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
  end

  def add_to_tab(amount)
    @tab += amount if money >= amount
  end

  def sees_favourite_song(songs)
      return "Woo!" if songs.include? @favourite_song
  end

  def buy(room, drink)
    room.sell_drink(self, drink)
  end

  def enter_venue(venue)
    venue.guest_enters(self)
  end

  def check_into_room(venue, room)
    venue.check_into_room(room , self)
  end

  def check_out_of_room(room, venue)
    room.check_out(self, venue)
  end


end
