class CreatePlsbgimages < ActiveRecord::Migration
  def change
    create_table :plsbgimages do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
