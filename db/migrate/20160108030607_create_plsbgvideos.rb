class CreatePlsbgvideos < ActiveRecord::Migration
  def change
    create_table :plsbgvideos do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
