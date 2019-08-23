class CreatePlaylistSong < ActiveRecord::Migration[5.2]
  def change
    create_table :playlist_songs do |t|
      t.string :playlist_id
      t.integer :song_id
      t.timestamps
    end
  end
end
