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
        puts playlist.view_list
      when 'a', 'add'
        puts playlist.add_song
      when 'd', 'delete'
        puts playlist.delete_song
      when 'q', 'quit'
        puts "\nGoodbye!"; exit 0
      else 
        puts "\n!! Invalid input; please try again."
      end
    
    end
  end

  def continue? 
    "\n> Continue? (Y/N)"
  end

  def user_inp 
    gets.chomp.strip.downcase
  end

end

Playlist.main_menu