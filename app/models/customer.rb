class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image
  has_many :cards
  has_many :card_comments
  has_many :favorites, dependent: :destroy

  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end

  # DM送受信の関係
  has_many :senders, class_name: "TalkRoom", foreign_key: "sender_id", dependent: :destroy
  has_many :recipients, class_name: "TalkRoom", foreign_key: "recipient_id", dependent: :destroy

  # 一覧画面で使う
  has_many :sending_customers, through: :senders, source: :recipient
  has_many :recipienting_customers, through: :recipients, source: :sender




GUEST_USER_EMAIL = "guest@example.com"

  def self.guest
    find_or_create_by!(email: GUEST_USER_EMAIL) do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.name = "guestuser"
    end
  end

  private

  def check_active_status
    if saved_change_to_is_active? && !is_active
    # 顧客が退会処理を行った場合の処理
      self.update(is_active: false) # 退会ステータスを更新
    end
  end
end
