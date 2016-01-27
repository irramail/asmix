class CreatePlsbgvideoMediafiles < ActiveRecord::Migration
  def change
    create_table :plsbgvideo_mediafiles do |t|
      t.references :plsbgvideo, index: true, foreign_key: true
      t.references :mediafile, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
