class CreatePlsbgvideoDevices < ActiveRecord::Migration
  def change
    create_table :plsbgvideo_devices do |t|
      t.references :plsbgvideo, index: true, foreign_key: true
      t.references :device, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
