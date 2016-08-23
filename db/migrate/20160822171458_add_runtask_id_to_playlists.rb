class AddRuntaskIdToPlaylists < ActiveRecord::Migration
  def change
    add_column :playlists, :runtask_id, :integer
  end
end
