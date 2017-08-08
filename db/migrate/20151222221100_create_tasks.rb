class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :device, index: true, foreign_key: true
      t.references :typeoftask, index: true, foreign_key: true
      t.references :typeofstatus, index: true, foreign_key: true
      t.text :options

      t.timestamps null: false
    end
  end
end
