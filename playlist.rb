#--- includes ---#
require 'yaml'
require 'shellwords'
require 'date'
require './lib/song_list'
require './lib/song'

module Playlist
  module_function
  def main_menu
    # start of user interaction
    playlist = SongList.new

    loop do
      puts "\n" + YAML::load(<<-EOM)
        |
          What would you like to do?
          > [v] view        view full playlist
          > [a] add         add new song to playlist
          > [d] delete      remove existing song from playlist
          > [q] quit        quit program
      EOM

      argv = Shellwords.split(user_inp)

      case argv[0]
      when 'v', 'view'
        puts view
      when 'a', 'add'
        puts add
      when 'd', 'delete'
        puts delete
      when 'q', 'quit'
        puts "\nGoodbye!"; exit 0
      else 
        puts "\n!! Invalid input; please try again."
      end
    
    end
  end

  def user_inp 
    gets.chomp.strip.downcase
  end

  # Fetches and displays current playlist for user 
  def view
    list = SongList.list

    unless list.empty?
      puts "\n— — — — — — — — — — — — — — — — — — — — — — —"
      puts "|  title  |  artist  |  album  |  date added "
      puts "— — — — — — — — — — — — — — — — — — — — — — —"
      list.each do |song| 
        puts %Q{| "#{song.title}"  |  #{song.artist}  |  #{song.album}  |  #{song.date_added}"}
      end
      puts "— — — — — — — — — — — — — — — — — — — — — — —\n"
      puts "count: #{list.count.to_s} songs in list."
    else
      puts "\n[empty]"
    end
  end

  # Adds song to playlist using information provided by user
  def add
    title=""; artist=""; album=""
    
    loop do
      puts "\n> Title: "
      title = Playlist.user_inp
      puts "> Artist: "
      artist = Playlist.user_inp
      puts "> Album: "
      album = Playlist.user_inp

      unless title.empty? || artist.empty?
        break
      else
        puts "\n!! Invalid input; please try again."
      end
    end

    exit_code = SongList.add_song(title, artist, album)

    if exit_code == 0
      puts "\n-- #{add_title} by #{add_artist} added to playlist on #{song.date_added}"
    elsif exit_code == 1
      puts "\n[!] Song already exists!"
    else
      puts "\n[!] Unknown error occurred"
    end

  end

  # Removes song from playlist matching details provided by user
  def delete
    title=""; artist=""; album=""
    
    loop do
      puts "\n> Title: "
      title = Playlist.user_inp
      puts "> Artist: "
      artist = Playlist.user_inp
      
      unless title.empty? || artist.empty?
        break
      else
        puts "\n!! Invalid input; please try again."
      end
    end
    
    exit_code == SongList.delete_song(title, artist)
    
    if exit_code == 0
      puts "\n-- #{add_title} by #{add_artist} deleted from playlist."
    elsif exit_code == 1
      puts "\n[!] Song not found!"
    else
      puts "\n[!] Unknown error occurred"
    end
  end

end

Playlist.main_menu