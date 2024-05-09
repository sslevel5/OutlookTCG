class TalkRoom < ApplicationRecord
  belongs_to :sender, class_name: "Customer"
  belongs_to :recipient, class_name: "Customer"
  has_many :talk_room_messages
  has_many :customers

  # 送信者を取得するメソッドを定義
  def senders
    Customer.where(id: sender_id)
  end

  # 送信したときの処理
  def self.sendhoge(sender_id,recipient_id)
    # sender_id, recipient_id を指定して TalkRoom を作成
    TalkRoom.create(sender_id: sender_id, recipient_id: recipient_id)
  end

  # 送信していれば true を返す
  def sending?(customer)
    sender == customer
  end

  # 送信者または受信者の名前を返すメソッドを定義
  def name(current_customer)
    if sender == current_customer
      recipient.name
    elsif recipient == current_customer
      sender.name
    else
      "Unknown"
    end
  end

  def last_message_with_sender
    last_message = talk_room_messages.where(is_active: true).order(created_at: :desc).first
    sender = last_message&.customer
    { message: last_message, sender: sender }
  end

  def unread_messages_count(customer)
    talk_room_messages.where.not(customer_id: customer.id, read: true).count
  end

  def mark_messages_as_read(customer)
    # トークルームに関連する未読メッセージをすべて既読にする
    talk_room_messages.where.not(customer_id: customer.id).where(read: false).update_all(read: true)
  end

  # 未読メッセージ数をリセットするメソッド
  def reset_unread_messages_count(customer)
    # トークルームに関連する未読メッセージをすべて既読にする
    talk_room_messages.where(customer_id: customer.id, read: false).update_all(read: true)
  end


  def unread_messages_count(customer)
    talk_room_messages.where.not(customer_id: customer.id).where(read: false).count
  end

end
