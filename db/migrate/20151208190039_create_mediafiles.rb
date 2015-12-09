class CreateMediafiles < ActiveRecord::Migration
  def change
    create_table :mediafiles do |t|
      t.string :file
      t.string :md5
      t.references :content, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
