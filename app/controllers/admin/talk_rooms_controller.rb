class Admin::TalkRoomsController < ApplicationController
  before_action :authenticate_admin!
  before_action :nul_talk_room, only: [:show]

  def index
    @talk_rooms = TalkRoom.all
  end

  def show
    @against_customer = Customer.find(params[:against_customer_id])
    @talk_room = TalkRoom.find(params[:id])
  end

  private

  def nul_talk_room
    if params[:id]
      @talk_room = TalkRoom.find_by(id: params[:id])
      if @talk_room == nil
        render 'layouts/notfind'
      end
    end
  end

end
