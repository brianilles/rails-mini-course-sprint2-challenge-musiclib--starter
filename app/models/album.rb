class Album < ApplicationRecord
  belongs_to :artist
  has_many :songs

  validates :name, presence: true

  # lists only available albums ordered by name
  scope :available, -> { where(available: true).order(:name)}

  # totals up all songs' on an album
  def length_seconds
    songs.reduce(0) { |length, song| length + song.length_seconds }
  end
end
