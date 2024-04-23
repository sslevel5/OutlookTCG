class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
   @raritys = Rarity.all
   @stores = Store.all
  end

  def about
   @raritys = Rarity.all
   @stores = Store.all
  end

  def home
   @raritys = Rarity.all
   @stores = Store.all
   @cards = Card.order(created_at: :desc).search(params[:q]).by_rarity(params[:rarity_id]).by_store(params[:store_id])
  end
end
