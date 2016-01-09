class CreatePlsbgmusics < ActiveRecord::Migration
  def change
    create_table :plsbgmusics do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
