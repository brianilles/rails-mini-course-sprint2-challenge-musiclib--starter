class Album < ApplicationRecord
  belongs_to :artist
  has_many :songs

  validates :name, presence: true

  def length_seconds
    self.songs.reduce(0) { |length, song| length + song.length_seconds }
  end
end
