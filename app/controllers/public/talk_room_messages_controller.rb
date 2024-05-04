class Public::TalkRoomMessagesController < ApplicationController
  before_action :authenticate_customer!

  def create
    @talk_room = TalkRoom.find(params[:talk_room_id])
    @message = @talk_room.talk_room_messages.build(message_params)
    @message.customer = current_customer
    against_customer_id = @talk_room.sending?(current_customer) ? @talk_room.recipient_id : @talk_room.sender_id

    if @message.save
      @talk_room.mark_messages_as_read(current_customer)
    end
    #redirect_to talk_rooms_path(@talk_room.id, against_customer_id: against_customer_id)
  end

  def update
    @message = TalkRoomMessage.find(params[:id])
    @talk_room = @message.talk_room # メッセージに関連するトークルームを取得
    # メッセージが属するトークルームから受信者のIDを取得
    against_customer_id = @talk_room.recipient_id
    @against_customer = Customer.find(against_customer_id)
    @message.update(message_params)
    #redirect_to talk_rooms_path(id: @talk_room.id, against_customer_id: against_customer_id)
    flash[:notice] = "変更しました。"
    redirect_to talk_rooms_path(@talk_room.id, against_customer_id: against_customer_id)
  end

  private

  def message_params
    params.require(:talk_room_message).permit(:message, :is_active)
  end
end
