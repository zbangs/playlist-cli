#--- includes ---#
require 'minitest/autorun'
require './lib/song_list'

#--- classes ---#
class TestSongList < Minitest::Test
  def setup
    @list = SongList.new
  end
  
  def test_song_added
    assert_equal 0, @list.add_song("Ivy","Frank Ocean", "Blonde")
    assert_equal 0, @list.add_song("YOU'RE THE ONE","Kaytranada", "99.9%")
    assert_equal 0, @list.add_song("River", "LEON BRIDGES")
    assert_equal 0, @list.add_song("sent from above", "river tiber")
  end

  def test_song_not_added
    assert_equal 1, @list.add_song("", "SG Lewis", "HEAT")
    assert_equal 1, @list.add_song("Pulp Jam", "", "Paranoia Pack")
    assert_equal 1, @list.add_song("","","")
  end

  def test_song_deleted
    @list.add_song("YOU'RE THE ONE", "Kaytranada", "99.9%")
    @list.add_song("River", "LEON BRIDGES")
    assert_equal 0, @list.delete_song("river", "leon bridges")
    assert_equal 0, @list.delete_song("you're the one", "kaytranada")
  end

  def test_song_not_deleted
    assert_equal 1, @list.delete_song("plastic", "moses sumney")
    assert_equal 1, @list.delete_song("ivy", "")
    assert_equal 1, @list.delete_song("", "river tiber")
  end

end