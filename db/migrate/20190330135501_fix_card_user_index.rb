class FixCardUserIndex < ActiveRecord::Migration[5.1]
  def change
    change_table :cards_users do |t|
      t.remove_index name: "index_cards_users_on_users_id"
      t.index [:users_id, :cards_id], unique: true
    end
  end
end
