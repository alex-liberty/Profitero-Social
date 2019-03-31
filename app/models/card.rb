class Card < ApplicationRecord
  has_and_belongs_to_many :users, foreign_key: :cards_id, association_foreign_key: :users_id
   after_create :notify_pusher, on: :create

   def notify_pusher
     Pusher.trigger('card', 'new', self.as_json)
   end
end
