class Bar

  attr_reader :drinks

  def initialize()
    @drinks = [
      {drink: "beer",
        price: 3},
      {drink: "wine",
        price: 4},
      {drink: "spirit",
        price: 4},
      {drink: "soft drink",
        price: 1}
      ]
  end

  def sell_drink(guest, drink)
    guest.remaining_cash >= drink[:price] ? drink[:price] : false
  end

  def search(type)
    return @drinks.find { |drink| drink[:drink] == type}
  end
end
