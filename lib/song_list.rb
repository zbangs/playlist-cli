require './lib/song'

class SongList < Array
  attr_accessor :list

  def initialize(list=[])
    @list = list
  end

  # display current list of songs added to the playlist
  def view_list
    num = 0

    unless list.empty?
      puts "\n— — — — — — — — — — — — — — — — — — — — — — —"
      puts "|  title  |  artist  |  album  |  date added "
      puts "— — — — — — — — — — — — — — — — — — — — — — —"
      list.each do |song| 
        num += 1
        puts %Q{| "#{song.title}"  |  #{song.artist}  |  #{song.album}  |  #{song.date_added}"}
      end
      puts "— — — — — — — — — — — — — — — — — — — — — — —\n"
    else
      puts "\n[empty]"
    end
  end

  # add a new song to the playlist
  def add_song
    add_title = ""
    add_artist = ""
    add_album = ""

    while add_title.empty? || add_artist.empty? do
      puts "\n> Title: "
      add_title = Playlist.user_inp
      puts "> Artist: "
      add_artist = Playlist.user_inp
      puts "> Album: "
      add_album = Playlist.user_inp

      if add_title.empty? || add_artist.empty?
        puts "\n!! Invalid input; please try again."
      end
    end
    
    song = Song.new(add_title, add_artist, add_album)
    @list.push(song)

    puts "\n-- #{add_title} by #{add_artist} added to playlist on #{song.date_added}"
  end

  # remove an existing song from the playlist
  def delete_song
    del_title = ""
    del_artist = ""

    while del_title.empty? || del_artist.empty? do
      puts "\n> Title: "
      del_title = Playlist.user_inp
      puts "> Artist: "
      del_artist = Playlist.user_inp

      if del_title.empty? || del_artist.empty?
        puts "\n!! Invalid input; please try again."
      end
    end

    @list.each do |song|  
      if song.title == del_title && song.artist == del_artist
        @list.delete(song)
      end
    end

    puts "\n-- #{del_title} by #{del_artist} deleted from playlist."
  end
