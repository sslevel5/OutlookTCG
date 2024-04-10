class Public::TalkRoomsController < ApplicationController

  def create
    current_customer.send(params[:customer_id])
    redirect_to request.referer
  end

end
