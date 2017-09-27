class CreateTodos < ActiveRecord::Migration[5.1]
  def change
    create_table :users, force: :cascade do |t|
      t.string :name, null: false
      t.string :psid, null: false
    end

    create_table :todos, force: :cascade do |t|
      t.text :item, null: false
      t.references :user
      t.timestamps
    end
  end
end
