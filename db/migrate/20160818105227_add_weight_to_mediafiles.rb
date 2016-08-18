class AddWeightToMediafiles < ActiveRecord::Migration
  def change
    add_column :mediafiles, :weight, :integer
  end
end
