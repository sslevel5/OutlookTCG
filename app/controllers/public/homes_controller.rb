class Public::HomesController < ApplicationController

  def top
    @cards = Card.order(created_at: :desc).where(is_active: true).limit(12)
  end

  def about

  end

  def home
    @card = Card.new
    @cards = Card.order(created_at: :desc).where(is_active: true)
  end

end
