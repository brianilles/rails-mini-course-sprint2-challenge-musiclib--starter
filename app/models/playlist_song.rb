class PlaylistSong < ApplicationRecord
    # belongs to both a playlist and a song
    belongs_to :playlist 
    belongs_to :song
end
