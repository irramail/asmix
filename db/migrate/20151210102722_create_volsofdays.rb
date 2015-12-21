class CreateVolsofdays < ActiveRecord::Migration
  def change
    create_table :volsofdays do |t|
      t.string :time
      t.integer :value
      t.references :market, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
