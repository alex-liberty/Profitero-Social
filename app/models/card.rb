class Card < ApplicationRecord
  has_and_belongs_to_many :users, foreign_key: :cards_id, association_foreign_key: :users_id
end
