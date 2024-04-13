class Public::TalkRoomMessagesController < ApplicationController
  before_action :authenticate_customer!

  def create
    @raritys = Rarity.all
    @stores = Store.all
    @talk_room = TalkRoom.find(params[:talk_room_id])
    @message = @talk_room.talk_room_messages.build(message_params)
    @message.customer = current_customer
    against_customer_id = @talk_room.sending?(current_customer) ? @talk_room.recipient_id : @talk_room.sender_id
    if @message.save
      redirect_to talk_rooms_path(@talk_room.id, against_customer_id: against_customer_id)
    else
      @against_customer = @talk_room.opposite_customer(current_customer)
      render :show
    end
  end

  private

  def message_params
    params.require(:talk_room_message).permit(:message)
  end

end
