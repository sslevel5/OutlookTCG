class Public::HomesController < ApplicationController

  def top

  end

  def about

  end

  def home
    @cards = Card.order(created_at: :desc)
  end
end
