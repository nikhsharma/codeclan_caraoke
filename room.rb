class Room

  attr_reader :songs, :guests, :tab, :bar

  def initialize(songs, bar)
    @songs = songs
    @bar = bar
    @guests = []
    @entry_fee = 10
    @tab = []
  end

  def check_in(guest)
    if guest.money >= @entry_fee
      @guests.push(guest) if @guests.count < 8
      guest.add_to_tab(@entry_fee)
      guest.sees_favourite_song(@songs)
    end
  end

  def check_out(guest, venue)
    guest.pay(guest.tab)
    @guests.delete(guest)
    venue.guests.push(guest)
  end

  def add_song(song)
    @songs.push(song)
  end

  def play_song(song)
    return song.play
  end

  def sell_drink(guest, drink)
    guest.add_to_tab(@bar.sell_drink(guest, drink)) if @bar.sell_drink(guest, drink)
  end

  def guests_tab()
    @tab = @guests.map {|guest| {guest: guest.name, tab: guest.tab} }
  end


end
