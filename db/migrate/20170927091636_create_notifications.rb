class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.datetime :notify_at, null: false
      t.references :todo
      t.timestamps
    end
  end
end
