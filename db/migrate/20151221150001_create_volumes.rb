class CreateVolumes < ActiveRecord::Migration
  def change
    create_table :volumes do |t|
      t.references :device, index: true, foreign_key: true
      t.string :description
      t.string :name
      t.integer :value

      t.timestamps null: false
    end
  end
end
