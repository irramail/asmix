class CreateTypeofstatuses < ActiveRecord::Migration
  def change
    create_table :typeofstatuses do |t|
      t.string :name
      t.integer :priority

      t.timestamps null: false
    end
  end
end
