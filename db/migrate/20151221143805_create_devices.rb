class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.references :market, index: true, foreign_key: true
      t.string :name
      t.integer :ping
      t.integer :tzdate
      t.string :sn
      t.text :comment
      t.boolean :active
      t.integer :eq0
      t.integer :eq1
      t.integer :eq2
      t.integer :eq3
      t.integer :eq4
      t.integer :eq5
      t.integer :eq6
      t.integer :eq7
      t.integer :eq8
      t.integer :eq9

      t.timestamps null: false
    end
  end
end
