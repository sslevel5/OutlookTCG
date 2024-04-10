class Public::TalkRoomMessagesController < ApplicationController
  before_action :authenticate_customer!

  def create
    @talk_room = TalkRoom.find(params[:talk_room_id])
    @message = @talk_room.talk_room_messages.build(message_params)
    @message.customer = current_customer

    if @message.save
      redirect_to @talk_room, notice: 'メッセージが送信されました。'
    else
      render :new
    end
  end

  private

  def message_params
    params.require(:talk_room_message).permit(:message)
  end

end
