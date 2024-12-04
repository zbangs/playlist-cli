require "date"
require 

class Song
  attr_accessor :title
  attr_accessor :artist
  attr_accessor :album
  attr_reader :date_added

  def initialize(title, artist, album)    
    @title = title
    @artist = artist
    @album = album
    @date_added = Date.today.strftime("%B %d, %Y %H:%M")
  end

end