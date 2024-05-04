class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image
  has_many :cards
  has_many :card_comments
  has_many :favorites, dependent: :destroy
  has_many :talk_rooms
  has_many :contacts

  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end

  # DM送受信の関係
  has_many :sent_talk_rooms, class_name: "TalkRoom", foreign_key: "sender_id", dependent: :destroy
  has_many :received_talk_rooms, class_name: "TalkRoom", foreign_key: "recipient_id", dependent: :destroy

  # 一覧画面で使う
  has_many :sending_customers, through: :sent_talk_rooms, source: :recipient
  has_many :receiving_customers, through: :received_talk_rooms, source: :sender

  validates :name, presence: true, length: { maximum: 10 }
  validates :introduction, length: { maximum: 160 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: URI::MailTo::EMAIL_REGEXP },
                    uniqueness: { case_sensitive: false }

GUEST_USER_EMAIL = "guest@example.com"

  def self.guest
    find_or_create_by!(email: GUEST_USER_EMAIL) do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.name = "guestuser"
    end
  end

  def already_messaged_with?(customer)
    TalkRoom.find_by(sender_id: self.id, recipient_id: customer.id) ||  TalkRoom.find_by(sender_id: customer.id, recipient_id: self.id)
  end

  def my_talk_room(customer)
    TalkRoom.find_by(sender_id: self.id, recipient_id: customer.id) ||  TalkRoom.find_by(sender_id: customer.id, recipient_id: self.id)
  end

  def unread_messages_count
    TalkRoomMessage.joins(:talk_room)
                   .where("talk_rooms.sender_id = ? OR talk_rooms.recipient_id = ?", id, id)
                   .where("talk_room_messages.customer_id != ? AND talk_room_messages.is_active = ?", id, true)
                   .where(read: false)
                   .count
  end

  private

  def check_active_status
    if saved_change_to_is_active? && !is_active
    # 顧客が退会処理を行った場合の処理
      self.update(is_active: false) # 退会ステータスを更新
    end
  end
end
