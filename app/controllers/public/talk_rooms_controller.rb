class Public::TalkRoomsController < ApplicationController
  before_action :authenticate_customer!

  def new
    # 新しいメッセージを作成するためのフォームを表示するためのアクション
    @talk_room = TalkRoom.sendhoge(current_customer.id, params[:against_customer_id] )
    redirect_to talk_rooms_path(params[:against_customer_id])
  end

  def create
    @raritys = Rarity.all
    @stores = Store.all
    recipient = Customer.find(params[:recipient_id])
    @talk_room = TalkRoom.find_or_create_by(sender_id: current_customer.id, recipient_id: recipient.id)
    redirect_to public_talk_room_path(@talk_room)
  end

  def index
    @raritys = Rarity.all
    @stores = Store.all
    @talk_rooms = TalkRoom.where("sender_id = ? OR recipient_id = ?", current_customer.id, current_customer.id)
  end

  def show
    @raritys = Rarity.all
    @stores = Store.all
    against_customer = Customer.find(params[:against_customer_id])
    @talk_room = TalkRoom.find_by(sender_id: current_customer.id, recipient_id: against_customer.id)
    @talk_room　||= TalkRoom.find_by(sender_id: against_customer.id, recipient_id: current_customer.id)

  end

  def senders
    @raritys = Rarity.all
    @stores = Store.all
    customer = Customer.find(params[:id])
    @customers = customer.sending_customers
  end
end
