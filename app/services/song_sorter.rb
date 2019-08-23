class SongSorter
    def initialize(songs, sort_value)
        @songs = songs
        @sort_value = sort_value
    
    def sort
        if params[:sort] == "random"
          @sorted_songs = @songs.to_a.shuffle
        elsif params[:sort] == "reverse"
          @sorted_songs = @songs.to_a.reverse
        else
          @sorted_songs = @songs
        end
    end
end