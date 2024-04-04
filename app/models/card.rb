class Card < ApplicationRecord
  has_one_attached :image
  belongs_to :rarity, optional: true
  belongs_to :store, optional: true
end
