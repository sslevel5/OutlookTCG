class Admin::TalkRoomsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @raritys = Rarity.all
    @stores = Store.all
    @talk_rooms = TalkRoom.all
  end

  def show
    @raritys = Rarity.all
    @stores = Store.all
    @against_customer = Customer.find(params[:against_customer_id])
    @talk_room = TalkRoom.find(params[:id])
  end


end
