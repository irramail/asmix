class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :device, index: true, foreign_key: true
      t.datetime :runtime
      t.text :text

      t.timestamps null: false
    end
  end
end
