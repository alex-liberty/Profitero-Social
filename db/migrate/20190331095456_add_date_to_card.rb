class AddDateToCard < ActiveRecord::Migration[5.1]
  def change
    add_column :cards, :event_date, :date
    add_column :cards, :max_users_count, :integer
  end
end
