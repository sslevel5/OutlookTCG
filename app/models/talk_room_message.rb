class TalkRoomMessage < ApplicationRecord

  belongs_to :talk_room
  belongs_to :customer

  validates :message, presence: true, length: { maximum: 280 }

end
