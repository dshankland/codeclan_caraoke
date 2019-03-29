require('minitest/autorun')
require('minitest/rg')
require_relative('../song')

class SongTest < MiniTest::Test

  def setup()
    @song1 = Song.new("Ooh La La")
  end

  def test_song_info()
    assert_equal("Ooh La La", @song1.title)
  end

end