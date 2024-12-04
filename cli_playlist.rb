#--- includes ---#
require 'cli_playlist/song_list'
require 'cli_playlist/song'

require "date"
require "yaml"

#--- classes ---#


#--- methods ---#
def start_up
  
  puts YAML::load(<<-EOM) 
    |
      What would you like to do?
      -- view     view full playlist
      -- add      add new song to playlist
      -- edit     edit details of existing song in playlist
      -- remove   remove existing song from playlist
    EOM

end

start_up