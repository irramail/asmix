class AddDayIdToPlaylists < ActiveRecord::Migration
  def change
    add_column :playlists, :day_id, :integer
  end
end
