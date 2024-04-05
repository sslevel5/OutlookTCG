class CardComment < ApplicationRecord

  belongs_to :customer
  belongs_to :card

end
