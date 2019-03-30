class CreateCardsUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :cards_users do |t|

      t.timestamps
    end
  end
end
