class Admin::CardsController < ApplicationController

  def index
    @cards = Card.all
  end

  def show
   @card = Card.find(params[:id])
  end

  def edit
   @card = Card.find(params[:id])
    @raritys = Rarity.all
    @stores = Store.all
  end

  def update
   @card = Card.find(params[:id])
    @raritys = Rarity.all
    @stores = Store.all
   if @card.update(card_params)
    flash[:notice] = "状態を変更しました。"
     redirect_to public_card_path(@card.id)
   else
     flash.now[:alert] = "状態の変更に失敗しました。"
     render :edit
   end
  end

  private

  def card_params
    params.require(:card).permit(:rarity_id, :store_id, :title, :body, :price, :is_active, :image)
  end

end
