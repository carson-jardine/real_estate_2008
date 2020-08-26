class House

  def initialize(price, address)
    @price = price

  end

  def price
    @price.delete("$").to_i 

  end
end
