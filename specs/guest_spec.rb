require('minitest/autorun')
require('minitest/rg')
require_relative('../song')
require_relative('../guest')

class GuestTest < MiniTest::Test

  def setup()
    @song1 = Song.new("Ooh La La")
    @guest1 = Guest.new("Darren", 50, @song1)
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


end