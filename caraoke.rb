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


end
