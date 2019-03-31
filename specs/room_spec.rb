require('minitest/autorun')
require('minitest/rg')
require('pry')
require_relative('../room')
require_relative('../guest')
require_relative('../song')

class RoomTest < MiniTest::Test
  def setup()
    @song1 = Song.new("Faces", "Ooh La La")
    @song2 = Song.new("The Rolling Stones", "Gimme Shelter")
    @song3 = Song.new("The Rolling Stones", "Sympathy for the Devil")
    @song4 = Song.new("The Velvet Underground", "Oh! Sweet Nuthin'")
    @songlist1 = [@song1, @song2, @song3]
    @songlist2 = [@song1]
    @guest1 = Guest.new("Darren", 50, @song1)
    @guest2 = Guest.new("Dazza", 40, @song2)
    @guest3 = Guest.new("Dave", 60, @song3)
    @guest4 = Guest.new("Bob", 20, @song4)
    @guest5 = Guest.new("Norman", 2, nil)
    @guest6 = Guest.new("Fred", 3, nil)
    @guest7 = Guest.new("Jim", 25, @song4)
    @guest8 = Guest.new("James", 35, @song2)
    @room1 = Room.new("Oldies", @songlist1, 6)
    @room2 = Room.new("One Song", @songlist2, 3)
  end

  def test_get_room_info
    assert_equal("Oldies", @room1.name)
    assert_equal(3, @room1.songlist.count)
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
    @room1.check_in(@guest1)
    @room1.check_in(@guest2)
    @room1.check_out(@guest1)
    assert_equal(1, @room1.guestlist.count)
  end

  def test_add_song()
    @room1.add_song(@song4)
    assert_equal(4, @room1.songlist.count())
  end

  def test_check_capacity_on_check_in()
    @room1.check_in(@guest1)
    @room1.check_in(@guest2)
    @room1.check_in(@guest3)
    @room1.check_in(@guest4)
    @room1.check_in(@guest7)
    @room1.check_in(@guest8)
    assert_equal(5, @room1.guestlist.count)
  end

  def test_check_sufficient_funds_on_check_in()
    @room1.check_in(@guest1)
    @room1.check_in(@guest2)
    @room1.check_in(@guest3)
    @room1.check_in(@guest4)
    @room1.check_in(@guest5)
    @room1.check_in(@guest6)
    assert_equal(4, @room1.guestlist.count)
  end

  def test_add_song_check_favourite()
    @room2.check_in(@guest1)
    @room2.check_in(@guest2)
    @room2.check_in(@guest3)
    @room2.check_in(@guest4)
    @room2.check_in(@guest5)
    @room2.add_song(@song4)
  end

  def test_plays_next_song()
    @room1.plays_next_song()
    assert_equal("Karaoke room Oldies plays Gimme Shelter by The Rolling Stones", @room1.plays_next_song())
    assert_equal(1, @room1.songlist.count())
  end

  def test_plays_next_song_no_more_songs()
    @room1.plays_next_song()
    @room1.plays_next_song()
    @room1.plays_next_song()
    assert_equal("No more songs :(", @room1.plays_next_song())
  end

end