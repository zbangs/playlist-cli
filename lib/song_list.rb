require './lib/song'

class SongList < Array
  attr_accessor :list

  def initialize(list=[])
    @list = list
  end


  def add_song(title, artist, album="")
    duplicate = false

    self.each do |song|  
      if song.title == title && song.artist == artist
        duplicate = true
      end
    end

    unless duplicate
      song = Song.new(title, artist, album)
      self.push(song)
      return 0
    else 
      return 1
    end

  end


  def delete_song(title, artist)
    deleted = false
    
    self.each do |song|  
      if song.title == title && song.artist == artist
        self.delete(song)
        deleted = true
      end
    end

    if deleted
      return 0
    else
      return 1
    end

    return -1
  end
end