class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
  end

  def about
  end

  def home
    @cards = Card.order(created_at: :desc)
  end
end
