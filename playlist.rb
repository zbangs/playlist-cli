#--- includes ---#
require 'yaml'
require 'shellwords'
#require './lib/song_list'
#require './lib/song'

module Playlist
  class << self
    def main_menu
      # start of user interaction
      loop {
        puts YAML::load(<<-EOM)
          |
            What would you like to do?
              view        view full playlist
              add         add new song to playlist
              edit        edit details of existing song in playlist
              remove      remove existing song from playlist
              quit        quit program
        EOM

        argv = Shellwords.split(user_inp)

        case argv[0]
        when 'view'
          puts 'CALL VIEW FUNCTION'
          puts 'Continue? (Y/N)'; break if user_inp == 'n'
        when 'add'
          puts 'CALL ADD FUNCTION'
          puts 'Continue? (Y/N)'; break if user_inp == 'n'
        when 'edit'
          puts 'CALL EDIT FUNCTION'
          puts 'Continue? (Y/N)'; break if user_inp == 'n'
        when 'remove'
          puts 'CALL REMOVE FUNCTION'
          puts 'Continue? (Y/N)'; break if user_inp == 'n'
        when 'quit'
          break
        else 
          puts 'Invalid input; please try again.'
        end
      }

      puts 'Goodbye!'
      exit 0

    end
    

    def user_inp = gets.chomp.strip.downcase
  end
end

Playlist.main_menu