#--- includes ---#
require 'minitest/autorun'
require './lib/song'

#--- classes ---#
class TestSong < Minitest::Test
  # title, artist, album | expected = pass
  def setup
    @song = Song.new("Ivy", "Frank Ocean", "Blonde")
  end
  
  def test_get_info
    assert_equal "Ivy", @song.title, "Title not expected value"
    assert_equal "Frank Ocean", @song.artist, "Artist not expected value"
    assert_equal "Blonde", @song.album, "Album not expected value"
  end
end