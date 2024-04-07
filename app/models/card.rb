class Card < ApplicationRecord
  has_one_attached :image
  belongs_to :rarity, optional: true
  belongs_to :store, optional: true
  belongs_to :customer
  has_many :card_comments
  has_many :favorites, dependent: :destroy

  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end

end
