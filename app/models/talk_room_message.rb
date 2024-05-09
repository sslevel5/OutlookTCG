class TalkRoomMessage < ApplicationRecord
  after_create :create_notification

  belongs_to :talk_room
  belongs_to :customer

  validates :message, presence: true, length: { maximum: 280 }

  def create_notification
    Notification.create(sender_id: self.customer_id, recipient_id: self.talk_room.recipient_id, message: self.message, read: false)
  end

end
