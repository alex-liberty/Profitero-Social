class DeleteUsersFromCards < ActiveRecord::Migration[5.1]
  def change
    remove_column :cards, :users
  end
end
