class Admin::TalkRoomsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @raritys = Rarity.all
    @stores = Store.all
    @talk_rooms = TalkRoom.all
  end
end
