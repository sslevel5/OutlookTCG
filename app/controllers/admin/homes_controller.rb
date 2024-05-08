class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    @card_data = Card.order(created_at: :desc).search(params[:q]).by_rarity(params[:rarity_id]).by_store(params[:store_id])
    @cards = Kaminari.paginate_array(@card_data).page(params[:page]).per(24)
  end

  def home
    @card_data = Card.order(created_at: :desc).search(params[:q]).by_rarity(params[:rarity_id]).by_store(params[:store_id])
    @cards = Kaminari.paginate_array(@card_data).page(params[:page]).per(24)
  end
end
