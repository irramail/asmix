class CreatePlists < ActiveRecord::Migration
  def change
    create_table :plists do |t|
      t.references :suborder, index: true, foreign_key: true
      t.references :mediafile, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
