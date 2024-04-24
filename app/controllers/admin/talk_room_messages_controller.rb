class Admin::TalkRoomMessagesController < ApplicationController
  before_action :authenticate_admin!

  def update
    @message = TalkRoomMessage.find(params[:id])
    @talk_room = @message.talk_room # メッセージに関連するトークルームを取得
    # メッセージが属するトークルームから受信者のIDを取得
    against_customer_id = @talk_room.recipient_id
    @against_customer = Customer.find(against_customer_id)
    @message.update(message_params)
    flash[:notice] = "変更しました。"
    redirect_to admin_talk_room_path(id: @talk_room.id, against_customer_id: against_customer_id)
  end

  private

  def message_params
    params.require(:talk_room_message).permit(:message, :is_active)
  end

end
