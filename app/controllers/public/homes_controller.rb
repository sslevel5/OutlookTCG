class Public::HomesController < ApplicationController

  def top
    @cards = Card.order(created_at: :desc).where(is_active: true).limit(12)
  end

  def about

  end

  def home
    @card = Card.new
    @card_data = Card.order(created_at: :desc).where(is_active: true)
    @cards = Kaminari.paginate_array(@card_data).page(params[:page]).per(24)
  end

end
