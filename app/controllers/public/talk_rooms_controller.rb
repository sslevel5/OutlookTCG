class Public::TalkRoomsController < ApplicationController
  before_action :authenticate_customer!

  def new
    # 新しいメッセージを作成するためのフォームを表示するためのアクション
    @talk_room = TalkRoom.find(params[:talk_room_id])
    @talk_room_message = TalkRoomMessage.new
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
    @talk_room = TalkRoom.find(params[:id])
  end

  def senders
    @raritys = Rarity.all
    @stores = Store.all
    customer = Customer.find(params[:id])
    @customers = customer.sending_customers
  end
end
