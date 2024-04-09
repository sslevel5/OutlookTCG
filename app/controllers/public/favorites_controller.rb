class Public::FavoritesController < ApplicationController

  def create
    card = Card.find(params[:card_id])
    @favorite = current_customer.favorites.new(card_id: card.id)
    @favorite.save
    redirect_to public_card_path(card)
  end

  def destroy
    card = Card.find(params[:card_id])
    @favorite = current_customer.favorites.find_by(card_id: card.id)
    @favorite.destroy
    redirect_to public_card_path(card)
  end
end
