class AddCategoriesToCards < ActiveRecord::Migration[5.1]
  def change
    add_reference :cards, :category, foreign_key: true
  end
end
