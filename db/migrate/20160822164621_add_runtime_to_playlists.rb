class AddRuntimeToPlaylists < ActiveRecord::Migration
  def change
    add_column :playlists, :runtime, :datetime
  end
end
