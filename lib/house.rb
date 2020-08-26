class House
  attr_reader :address, :rooms

  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
  end

  def price
    @price.delete("$").to_i
  end

  def add_room(room)
    rooms << room
  end

  def above_market_average?
    price >= 500000
  end

  def rooms_from_category(category)
    rooms.find_all do |room|
      room.category == category
    end
  end

  def area
    rooms.sum do |room|
      room.area
    end
  end

  def details
    details = {
      "price" => price,
      "address" => address
    }
  end

  def price_per_square_foot
    (price.to_f / area).round(2)
  end
end
