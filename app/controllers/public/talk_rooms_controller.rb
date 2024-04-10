class Public::TalkRoomsController < ApplicationController
  before_action :authenticate_customer!
  
  def create
    recipient = Customer.find(params[:customer_id])
    @talk_room = TalkRoom.find_or_create_by(sender_id: current_customer.id, recipient_id: recipient.id)
    redirect_to @talk_room
  end

  def index
    @talk_rooms = TalkRoom.where("sender_id = ? OR recipient_id = ?", current_customer.id, current_customer.id)
  end

  def senders
    customer = Customer.find(params[:id])
    @customers = customer.sending_customers
  end
  
end
