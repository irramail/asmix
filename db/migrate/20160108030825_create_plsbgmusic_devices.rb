class CreatePlsbgmusicDevices < ActiveRecord::Migration
  def change
    create_table :plsbgmusic_devices do |t|
      t.references :plsbgmusic, index: true, foreign_key: true
      t.references :device, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
