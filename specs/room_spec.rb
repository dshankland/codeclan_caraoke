require('minitest/autorun')
require('minitest/rg')
require('pry')
require_relative('../room')
require_relative('../guest')
require_relative('../song')

class RoomTest < MiniTest::Test
  def setup()
    @song1 = Song.new("Ooh La La")
    @song2 = Song.new("Gimme Shelter")
    @song3 = Song.new("Sympathy for the Devil")
    @song4 = Song.new("Oh! Sweet Nuthin'")
    @songlist1 = [@song1, @song2, @song3, @song4]
    @guest1 = Guest.new("Darren", 50, @song1)
    @guest2 = Guest.new("Dazza", 40, @song2)
    @guest3 = Guest.new("Dave", 60, @song3)
    @guest4 = Guest.new("Bob", 20, @song4)
    @guest5 = Guest.new("Norman", 2, nil)
    @guest6 = Guest.new("Fred", 3, nil)
    @room1 = Room.new("Oldies", @songlist1, 6)
  end

  def test_get_room_info
    assert_equal("Oldies", @room1.name)
    assert_equal(4, @room1.songlist.count)
    assert_equal([], @room1.guestlist)
    assert_equal(5, @room1.capacity)
    assert_equal(6, @room1.entry_fee)
  end

  def test_guest_check_in()
    @room1.check_in(@guest1)
    assert_equal(1, @room1.guestlist.count)
    assert_equal(6, @room1.till)
    assert_equal(44, @guest1.money)
  end

  def test_guest_check_out()
    # binding.pry
    @room1.check_in(@guest1)
    @room1.check_in(@guest2)
    @room1.check_out(@guest1)
    assert_equal(1, @room1.guestlist.count)
  end

end