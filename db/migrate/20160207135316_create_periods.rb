class CreatePeriods < ActiveRecord::Migration
  def change
    create_table :periods do |t|
      t.integer :value
      t.string :name

      t.timestamps null: false
    end
  end
end
