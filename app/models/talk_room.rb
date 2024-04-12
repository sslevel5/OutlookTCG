class TalkRoom < ApplicationRecord
  belongs_to :sender, class_name: "Customer"
  belongs_to :recipient, class_name: "Customer"
  has_many :talk_room_messages

  # 送信者を取得するメソッドを定義
  def senders
    Customer.where(id: sender_id)
  end

  # 送信したときの処理
  def send(customer_id)
    # sender_id を指定して TalkRoom を作成
    TalkRoom.create(sender_id: customer_id, recipient_id: recipient_id)
  end

  # 送信していれば true を返す
  def sending?(customer)
    senders.include?(customer)
  end
end
