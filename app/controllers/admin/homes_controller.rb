class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    @cards = Card.order(created_at: :desc).search(params[:q]).by_rarity(params[:rarity_id]).by_store(params[:store_id])
  end

  def home
   @cards = Card.order(created_at: :desc).search(params[:q]).by_rarity(params[:rarity_id]).by_store(params[:store_id])
  end
end
