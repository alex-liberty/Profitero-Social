class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.timestamps
      t.references :users
      t.string :name
      t.time :event_date
      t.string :title
      t.string :max_users_count
      t.string :users
    end
  end
end
