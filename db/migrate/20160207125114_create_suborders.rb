class CreateSuborders < ActiveRecord::Migration
  def change
    create_table :suborders do |t|
      t.references :order, index: true, foreign_key: true
      t.references :device, index: true, foreign_key: true
      t.references :period, index: true, foreign_key: true
      t.datetime :startdt
      t.datetime :stopdt
      t.datetime :startt
      t.datetime :stopt

      t.timestamps null: false
    end
  end
end
