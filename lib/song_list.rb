class Playlist
  class SongList
    attr_accessor :list

    def initialize(list={})
      @list = list
    end

    def add_song
    end

    def remove_song
    end

    def edit_song
    end

    def view_all
    end

    def sort_by(elem1=:title, elem2=:title)
    end

    def filter_by
    end
  end
end