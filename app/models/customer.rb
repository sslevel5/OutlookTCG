class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image
  has_many :cards
  has_many :card_comments

  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end

  private

  def check_active_status
    if saved_change_to_is_active? && !is_active
    # 顧客が退会処理を行った場合の処理
      self.update(is_active: false) # 退会ステータスを更新
    end
  end
end
