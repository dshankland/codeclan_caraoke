require('minitest/autorun')
require('minitest/rg')
require_relative('../song')
require_relative('../guest')
require_relative('../room')

class GuestTest < MiniTest::Test

  def setup()
    @song1 = Song.new("Faces", "Ooh La La")
    @song2 = Song.new("The Rolling Stones", "Gimme Shelter")
    @song3 = Song.new("The Rolling Stones", "Sympathy for the Devil")
    @song4 = Song.new("The Velvet Underground", "Oh! Sweet Nuthin'")
    @songlist1 = [@song1, @song2, @song3]
    @guest1 = Guest.new("Darren", 50, @song1)
    @guest2 = Guest.new("Dazza", 40, @song2)
    @guest3 = Guest.new("Dave", 60, @song3)
    @guest4 = Guest.new("Bob", 20, @song4)
    @guest5 = Guest.new("Norman", 2, nil)
    @guest6 = Guest.new("Fred", 3, nil)
    @room1 = Room.new("Oldies", @songlist1, 6)
  end

  def test_guest_info()
    assert_equal("Darren", @guest1.name)
    assert_equal(50, @guest1.money)
    assert_equal(@song1, @guest1.favourite_song)
  end

  def test_guest_pays()
    @guest1.pays(6)
    assert_equal(44, @guest1.money)
  end

  def test_guest_exclaims()
    assert_equal("Darren says: Ya dancer! I love Ooh La La! (as they check in to the room)", @guest1.exclaims(:check_in))
  end

  def test_sings_song()
    assert_equal("Darren sings Sympathy for the Devil", @guest1.sings(@song3))
  end

end