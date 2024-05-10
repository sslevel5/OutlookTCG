class Contact < ApplicationRecord
  belongs_to :customer

  validates :title, presence: true, length: { maximum: 20 }
  validates :message, presence: true, length: { maximum: 200 }

end
