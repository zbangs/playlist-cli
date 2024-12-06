require 'yaml'
require 'shellwords'
require 'date'

require './lib/song_list'
require './lib/song'


module Playlist
  module_function
  def main_menu
    # start of user interaction
    @playlist = SongList.new

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
    gets.chomp.downcase.strip
  end

  # Fetches and displays current playlist for user 
  def view
    unless @playlist.empty?
      puts "\n— — — — — — — — — — — — — — — — — — — — — — —"
      puts "|  title  |  artist  |  album  |  date added "
      puts "— — — — — — — — — — — — — — — — — — — — — — —"
      @playlist.each do |song| 
        puts %Q{| "#{song.title}"  |  #{song.artist}  |  #{song.album}  |  #{song.date_added}"}
      end
      puts "— — — — — — — — — — — — — — — — — — — — — — —\n"
      puts "count: #{@playlist.count.to_s} songs in list."
    else
      puts "\n[empty]"
    end
  end

  # Adds song to playlist using information provided by user
  def add
    title=""; artist=""; album=""
    
    loop do
      puts "\n> Title: "
      title = user_inp
      puts "> Artist: "
      artist = user_inp
      puts "> Album: "
      album = user_inp

      unless title.empty? || artist.empty?
        break
      else
        puts "\n!! Invalid input; please try again."
      end
    end

    exit_code = @playlist.add_song(title, artist, album)

    if exit_code == 0
      puts "\n-- #{title} by #{artist} added to playlist."
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
      title = user_inp
      puts "> Artist: "
      artist = user_inp
      
      unless title.empty? || artist.empty?
        break
      else
        puts "\n!! Invalid input; please try again."
      end
    end
    
    exit_code = @playlist.delete_song(title, artist)
    
    if exit_code == 0
      puts "\n-- #{title} by #{artist} deleted from playlist."
    elsif exit_code == 1
      puts "\n[!] Song not found!"
    else
      puts "\n[!] Unknown error occurred"
    end
  end

end

Playlist.main_menu