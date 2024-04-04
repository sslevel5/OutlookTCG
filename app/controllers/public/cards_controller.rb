class Public::CardsController < ApplicationController

  def new
    @card = Card.new
  end

  def index
    @cards = Card.all
  end

  def create
    @card = Card.new(card_params)
  end


  private

  def card_params
    params.require(:card).permit(:rarity_id, :store_id, :title, :body, :price, :is_active, :image)
  end
end
