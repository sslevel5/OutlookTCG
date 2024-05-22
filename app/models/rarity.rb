class Rarity < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
