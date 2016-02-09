class CreateSubordersTasks < ActiveRecord::Migration
  def change
    create_table :suborders_tasks do |t|
      t.references :suborder, index: true, foreign_key: true
      t.references :task, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
