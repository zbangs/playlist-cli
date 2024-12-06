#--- includes ---#
require 'minitest/autorun'
require './lib/song_list'

#--- classes ---#
class TestSongList < MiniTest::Test
  def setup
    @list = SongList.new
  end
  
  def test_song_added
    assert_equal 0, @list.add_song("Ivy","Frank Ocean", "Blonde"), "Add song failed"
    assert_equal 0, @list.add_song("YOU'RE THE ONE","Kaytranada", "99.9%"), "Add song failed"
    assert_equal 0, @list.add_song("River", "LEON BRIDGES"), "Add song failed"
    assert_equal 0, @list.add_song("sent from above", "river tiber"), "Add song failed"
  end

  def test_song_not_added
    assert_equal 1, @list.add_song("", "SG Lewis", "HEAT"), "Add song did not fail as expected"
    assert_equal 1, @list.add_song("Pulp Jam", "", "Paranoia Pack"), "Add song did not fail as expected"
    assert_equal 1, @list.add_song(), "Add song did not fail as expected"
  end

  def test_song_deleted
    assert_equal 0, @list.delete("river", "leon bridges"), "Delete song failed"
    assert_equal 0, @list.delete("you're the one", "kaytranada", "99.9%"), "Delete song failed"
  end

  def test_song_not_deleted
    assert_equal 1, @list.delete("plastic", "moses sumney"), "Delete song did not fail as expected"
    assert_equal 1, @list.delete("ivy", ""), "Delete song did not fail as expected"
    assert_equal 1, @list.delete("", "river tiber"), "Delete song did not fail as expected"
  end

end