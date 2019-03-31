class ChangeTimeToDateInCard < ActiveRecord::Migration[5.1]
  def change
    remove_column :cards, :event_date
    remove_column :cards, :max_users_count
  end
end
