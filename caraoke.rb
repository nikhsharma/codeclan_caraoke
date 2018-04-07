class Caraoke

  attr_reader :rooms, :bar, :guests

  def initialize(rooms, bar)
    @rooms = rooms
    @bar = bar
    @guests = []
  end

  def guest_enters(guest)
    @guests.push(guest)
  end

  def check_into_room(room, guest)
    room.check_in(guest)
  end

  def sells_drink(guest, drink)
    guest.pay(@bar.sell_drink(guest, drink)) if @bar.sell_drink(guest, drink)
  end


end
