class AddMediafileRefToTask < ActiveRecord::Migration
  def change
    add_reference :tasks, :mediafile, index: true, foreign_key: true
  end
end
