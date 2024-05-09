class ApplicationController < ActionController::Base
  before_action :set_common_variables
  before_action :side_talk_room

  def notfind
    render 'layouts/notfind'
  end

  private

  def set_common_variables
    @raritys = Rarity.all
    @stores = Store.all
  end

  def side_talk_room
    if customer_signed_in?
      @talk_rooms = TalkRoom.where("sender_id = ? OR recipient_id = ?", current_customer.id, current_customer.id)
    end
  end
end