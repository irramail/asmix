class AddFilenameToMediafiles < ActiveRecord::Migration
  def change
    add_column :mediafiles, :filename, :string
  end
end
