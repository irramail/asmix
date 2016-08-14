class AddIndexToMediafiles < ActiveRecord::Migration
  def change
    add_index :mediafiles, :md5, unique: true
  end
end
