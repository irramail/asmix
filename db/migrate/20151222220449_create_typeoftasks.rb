class CreateTypeoftasks < ActiveRecord::Migration
  def change
    create_table :typeoftasks do |t|
      t.string :name
      t.integer :priority

      t.timestamps null: false
    end
  end
end
