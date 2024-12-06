require './lib/song'

class SongList < Array
  attr_accessor :list

  def initialize(list=[])
    @list = list
  end

  # add a new song to the playlist
  def add_song(title, artist, album="")
    duplicate = @list.each do |song|  
      if song.title == title && song.artist == artist
        true
      end
    end

    unless duplicate
      song = Song.new(title, artist, album)
      @list.push(song)
      return 0
    else
      return 1
    end

    return -1
  end

  # remove an existing song from the playlist
  def delete_song(title, artist)
    found = @list.each do |song|  
      if song.title == title && song.artist == artist
        true
      end
    end

    if found
      @list.delete(song) 
      return 0
    else
      return 1
    end

    return -1
  end
end
