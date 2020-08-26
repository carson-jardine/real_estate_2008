require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'
require './lib/house'

class HouseTest < Minitest::Test

  def test_it_exists
    house = House.new("$400000", "123 sugar lane")

    assert_instance_of House, house
  end

  def test_it_has_a_price
    house = House.new("$400000", "123 sugar lane")

    assert_equal 400000, house.price
  end

  def test_it_has_an_address
    house = House.new("$400000", "123 sugar lane")

    assert_equal "123 sugar lane", house.address
  end

  def test_rooms_start_empty
    house = House.new("$400000", "123 sugar lane")

    assert_equal [], house.rooms
  end

  def test_it_can_add_rooms
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')

    house.add_room(room_1)
    house.add_room(room_2)

    assert_equal [room_1, room_2], house.rooms
  end

  def test_it_is_above_avg
    house_1 = House.new("$400000", "123 sugar lane")
    house_2 = House.new("$600000", "123 mountain lane")

    assert_equal false, house_1.above_market_average?
    assert house_2.above_market_average?
  end

  def test_it_can_find_rooms_from_category
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')
    room_3 = Room.new(:living_room, 25, '15')
    room_4 = Room.new(:basement, 30, '41')

    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)

    assert_equal [room_1, room_2], house.rooms_from_category(:bedroom)
    assert_equal [room_4], house.rooms_from_category(:basement)
  end

  def test_it_can_find_the_area_of_the_house
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')
    room_3 = Room.new(:living_room, 25, '15')
    room_4 = Room.new(:basement, 30, '41')

    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)

    assert_equal 1900, house.area
  end

  def test_it_can_find_details
    house_1 = House.new("$400000", "123 sugar lane")
    house_2 = House.new("$600000", "123 mountain lane")

    expected_1 = ({"price" => 400000, "address" => "123 sugar lane"})
    expected_2 = ({"price" => 600000, "address" => "123 mountain lane"})
    assert_equal expected_1, house_1.details
    assert_equal expected_2, house_2.details
  end

  def test_price_per_square_foot
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')
    room_3 = Room.new(:living_room, 25, '15')
    room_4 = Room.new(:basement, 30, '41')

    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)

    assert_equal 210.53, house.price_per_square_foot
  end
end

 # house = House.new("$400000", "123 sugar lane")
#=> #<House:0x00007fccd30375f8...>

 # room_1 = Room.new(:bedroom, 10, '13')
#=> #<Room:0x00007fccd29b5720...>

 # room_2 = Room.new(:bedroom, 11, '15')
#=> #<Room:0x00007fccd2985f48...>

 # room_3 = Room.new(:living_room, 25, '15')
#=> #<Room:0x00007fccd383c2d0 @category=:living_room, @length=25, @width=15>

 # room_4 = Room.new(:basement, 30, '41')
#=> #<Room:0x00007fccd297dc30 @category=:basement, @length=30, @width=41>

 # house.add_room(room_4)

 # house.add_room(room_1)

 # house.add_room(room_3)

 # house.add_room(room_2)

 # house.price_per_square_foot
#=> 210.53

 # house.rooms_sorted_by_area
#=> [#<Room:0x00007fccd297dc30...>, #<Room:0x00007fccd383c2d0...>, #<Room:0x00007fccd2985f48...>, #<Room:0x00007fccd29b5720...>]

 # house.rooms_by_category
#=> {:bedroom=>[#<Room:0x00007fccd29b5720...>, #<Room:0x00007fccd2985f48...>],
