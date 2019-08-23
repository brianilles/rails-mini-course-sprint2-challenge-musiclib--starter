class Album < ApplicationRecord
  belongs_to :artist
  has_many :songs

  validates :name, presence: true

  def length_seconds
    # totals up all songs' on an album
    self.songs.reduce(0) { |length, song| length + song.length_seconds }
  end
end
