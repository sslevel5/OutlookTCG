class TalkRoom < ApplicationRecord

  belongs_to :sender, class_name: "Customer"
  belongs_to :recipient, class_name: "Customer"

  #　送信したときの処理
  def send(customer_id)
    senders.create(recipient_id: customer_id)
  end

  #　送信していればtrueを返す
  def sending?(customer)
    sending_customers.include?(customer)
  end
end
