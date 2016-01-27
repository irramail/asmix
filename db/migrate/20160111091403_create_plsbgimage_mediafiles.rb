class CreatePlsbgimageMediafiles < ActiveRecord::Migration
  def change
    create_table :plsbgimage_mediafiles do |t|
      t.references :plsbgimage, index: true, foreign_key: true
      t.references :mediafile, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
