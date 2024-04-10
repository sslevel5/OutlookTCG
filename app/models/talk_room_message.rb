class TalkRoomMessage < ApplicationRecord

  belongs_to :talk_room
  belongs_to :customer

  validates :message, presence: true
  
end
