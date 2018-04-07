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

  def sell_drink(drink)
    return drink[:price]
  end
end
