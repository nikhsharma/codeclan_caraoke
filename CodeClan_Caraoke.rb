require_relative("caraoke.rb")
require_relative("bar.rb")
require_relative("room.rb")
require_relative("guest.rb")
require_relative("song.rb")


@song1 = Song.new("Test Song", "Dr. Test")
@song2 = Song.new("Testing, yo", "Test-o")
@songs1 = [@song1, @song2]
@song3 = Song.new("Trying Stuff", "Will-it-work")
@song4 = Song.new("Another Song", "Dr. Test")
@songs2 = [@song3, @song4]
@bar = Bar.new()
@blueroom = Room.new(@songs1, @bar)
@redroom = Room.new(@songs2, @bar)
@yellowroom = Room.new([@song2, @song3], @bar)
@rooms = [@room1, @room2, @room3]
@venue = Caraoke.new(@rooms, @bar)
@bob = Guest.new("Bob", 50, @song1)
@barb = Guest.new("Barb", 50, @song2)
@brenda = Guest.new("Brenda", 50, @song3)
@ben = Guest.new("Ben", 50, @song4)


def main_menu()
  system "clear"
  right_input = false
  puts "Guests: #{@venue.guests.map {|guest| guest.name}}"
  puts "MAIN MENU"
  puts "1. Venue"
  puts "2. Rooms"
  puts "0. Quit"

  until right_input == true
    input = gets.chomp
    system "clear"
    case input
    when "1"
      venue_menu()
      right_input = true
    when "2"
      room_menu()
      right_input = true
    when "0"
      exit
    else
      puts "Guests: #{@venue.guests.map {|guest| guest.name}}"
      puts "MAIN MENU"
      puts "1. Venue"
      puts "2. Rooms"
      puts "0. Quit"
      puts "Enter selection as number"
      right_input = false
    end
  end
end

def venue_menu()
  right_input = false
  puts "Guests: #{@venue.guests.map {|guest| guest.name}}"
  puts "VENUE"
  puts "1. Sell drink"
  puts "2. Check guest into a room"
  puts "3. Register new guest"
  puts "0. back"



  until right_input == true
    input = gets.chomp
    system "clear"
    case input
    when "1"
      #sell drink
      puts "Guests: #{@venue.guests.map {|guest| guest.name}}"
      puts "Which guest is buying?"
      guest  = @venue.search_guests(gets.chomp)
      if guest
        system "clear"
        good_input = false
        until good_input == true
          puts "Guests: #{@venue.guests.map {|guest| guest.name}}"
          puts "What drink?"
          puts "1. Beer"
          puts "2. Wine"
          puts "3. Spirit"
          puts "4. Soft drink"
          drink = gets.chomp
          case drink
          when "1"
            good_input = true
            @venue.bar.sell_drink(guest, @venue.bar.search("beer"))
          when "2"
            good_input = true
            @venue.bar.sell_drink(guest, @venue.bar.search("wine"))
          when "3"
            good_input = true
            @venue.bar.sell_drink(guest, @venue.bar.search("spirit"))
          when "4"
            good_input = true
            @venue.bar.sell_drink(guest, @venue.bar.search("soft drink"))
          else
            good_input = false
            puts "Guests: #{@venue.guests.map {|guest| guest.name}}"
            puts "What drink?"
            puts "1. Beer"
            puts "2. Wine"
            puts "3. Spirit"
            puts "4. Soft drink"
            puts "Enter selection as number"
          end
        end
      else
        system "clear"
        puts "Guests: #{@venue.guests.map {|guest| guest.name}}"
        puts "Guest not found"
      end
    when "2"
      #check guest into room

    when "3"
      #register new guest
      puts "Guests: #{@venue.guests.map {|guest| guest.name}}"
      puts "Enter guest's name:"
      @venue.guest_enters(Guest.new(gets.chomp, 50, @song1))
      system "clear"
      puts "Guests: #{@venue.guests.map {|guest| guest.name}}"
      puts "VENUE"
      puts "1. Sell drink"
      puts "2. Check guest into a room"
      puts "3. Register new guest"
      puts "0. back"
      right_input = false
    when "0"
      main_menu()
      right_input = true
    else
      puts "Guests: #{@venue.guests.map {|guest| guest.name}}"
      puts "VENUE"
      puts "1. Sell drink"
      puts "2. Check guest into a room"
      puts "3. Register new guest"
      puts "0. back"
      puts "Enter selection as number"
      right_input = false
    end
  end
end

def room_menu()
  right_input = false
  puts "ROOMS"
  puts "1. Blue Room"
  puts "2. Red Room"
  puts "3. Yellow Room"
  puts "0. back"


  until right_input == true
    input = gets.chomp
    system "clear"
    case input
    when "1"
      right_input = true
      blue_room_menu()
    when "2"
      right_input = true
      red_room_menu()
    when "3"
      right_input = true
      yellow_room_menu()
    when "0"
      right_input = true
      main_menu()
    else
      puts "ROOMS"
      puts "1. Blue Room"
      puts "2. Red Room"
      puts "3. Yellow Room"
      puts "0. back"
      puts "Enter selection as number"
      right_input = false
    end
  end
end

def blue_room_menu()
  right_input = false
  puts "BLUE ROOM"
  puts "1. Sell drink"
  puts "2. Check guest into room"
  puts "3. Check guest out of room"
  puts "4. Play song"
  puts "5. Add song"
  puts "0. back"


  until right_input == true
    input = gets.chomp
    system "clear"
    case input
    when "1"
      #sell drink
    when "2"
      #check guest in
    when "3"
      #check guest out
    when "4"
      #play song
    when "5"
      #add song
    when "0"
      right_input = true
      room_menu
    else
      puts "BLUE ROOM"
      puts "1. Sell drink"
      puts "2. Check guest into room"
      puts "3. Check guest out of room"
      puts "4. Play song"
      puts "5. Add song"
      puts "0. back"
      puts "Enter selection as number"
      right_input = false
    end
  end
end

def red_room_menu()
  right_input = false
  puts "RED ROOM"
  puts "1. Sell drink"
  puts "2. Check guest into room"
  puts "3. Check guest out of room"
  puts "4. Play song"
  puts "5. Add song"
  puts "0. back"


  until right_input == true
    input = gets.chomp
    system "clear"
    case input
    when "1"
      #sell drink
    when "2"
      #check guest in
    when "3"
      #check guest out
    when "4"
      #play song
    when "5"
      #add song
    when "0"
      right_input = true
      room_menu
    else
      puts "RED ROOM"
      puts "1. Sell drink"
      puts "2. Check guest into room"
      puts "3. Check guest out of room"
      puts "4. Play song"
      puts "5. Add song"
      puts "0. back"
      puts "Enter selection as number"
      right_input = false
    end
  end
end

def yellow_room_menu()
  right_input = false
  puts "YELLOW ROOM"
  puts "1. Sell drink"
  puts "2. Check guest into room"
  puts "3. Check guest out of room"
  puts "4. Play song"
  puts "5. Add song"
  puts "0. back"


  until right_input == true
    input = gets.chomp
    system "clear"
    case input
    when "1"
      #sell drink
    when "2"
      #check guest in
    when "3"
      #check guest out
    when "4"
      #play song
    when "5"
      #add song
    when "0"
      right_input = true
      room_menu
    else
      puts "YELLOW ROOM"
      puts "1. Sell drink"
      puts "2. Check guest into room"
      puts "3. Check guest out of room"
      puts "4. Play song"
      puts "5. Add song"
      puts "0. back"
      puts "Enter selection as number"
      right_input = false
    end
  end
end

main_menu()
