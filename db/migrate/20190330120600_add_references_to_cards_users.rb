class AddReferencesToCardsUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :cards_users, :users, foreign_key: true
    add_reference :cards_users, :cards, foreign_key: true
  end
end
