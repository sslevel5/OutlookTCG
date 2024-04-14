class CardComment < ApplicationRecord

  belongs_to :customer
  belongs_to :card
  
  validates :comment, presence: true, length: { maximum: 70 }

end
