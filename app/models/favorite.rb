class Favorite < ApplicationRecord

  belongs_to :customer
  belongs_to :card

  validates :customer_id, uniqueness: {scope: :card_id}

end
