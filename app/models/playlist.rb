class Playlist < ApplicationRecord
    validates :name, presence: true # ensures playlists always have names
    has_many :playlist_songs #can have many associated playlist_songs
    has_many :songs, through: :playlist_songs # can have many songs via the playlist_songs association
end
