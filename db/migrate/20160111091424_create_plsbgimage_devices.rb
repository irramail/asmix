class CreatePlsbgimageDevices < ActiveRecord::Migration
  def change
    create_table :plsbgimage_devices do |t|
      t.references :plsbgimage, index: true, foreign_key: true
      t.references :device, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
