class CreatePlsbgmusicMediafiles < ActiveRecord::Migration
  def change
    create_table :plsbgmusic_mediafiles do |t|
      t.references :plsbgmusic, index: true, foreign_key: true
      t.references :mediafile, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
