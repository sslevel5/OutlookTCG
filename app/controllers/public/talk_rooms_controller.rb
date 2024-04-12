class Public::TalkRoomsController < ApplicationController
  before_action :authenticate_customer!
  
  def create
    @raritys = Rarity.all
    @stores = Store.all
    recipient = Customer.find(params[:customer_id])
    @talk_room = TalkRoom.find_or_create_by(sender_id: current_customer.id, recipient_id: recipient.id)
    redirect_to @talk_room
  end

  def index
    @raritys = Rarity.all
    @stores = Store.all
    @talk_rooms = TalkRoom.where("sender_id = ? OR recipient_id = ?", current_customer.id, current_customer.id)
  end

  def senders
    @raritys = Rarity.all
    @stores = Store.all
    customer = Customer.find(params[:id])
    @customers = customer.sending_customers
  end
  
end
