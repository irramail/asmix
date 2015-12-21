class CreateWorktimeBroadcastings < ActiveRecord::Migration
  def change
    create_table :worktime_broadcastings do |t|
      t.references :market, index: true, foreign_key: true
      t.integer :wday
      t.string :start
      t.string :stop

      t.timestamps null: false
    end
  end
end
