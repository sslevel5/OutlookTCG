class Public::CardsController < ApplicationController
  before_action :authenticate_customer!, only: [:new, :create, :edit, :update]
  before_action :correct_customer, only: [:edit, :update]
  before_action :nul_card, only: [:edit, :update, :show]
  require 'nkf'

  def new
    @card = Card.new
  end

  def index
    @card = Card.new # モーダル用
    @card_data = Card.search(params[:q]).by_rarity(params[:rarity_id]).by_store(params[:store_id]).where(is_active: true).send(sort_order)
    @cards = Kaminari.paginate_array(@card_data).page(params[:page]).per(24)
  end

  def create
    @card = Card.new(card_params)
    @card.customer_id = current_customer.id

    if @card.title.match(/[一-龠々]/) #漢字を見つけ出す
      @card.conversion_title = NKF.nkf('-w -X', @card.title).to_kanhira.to_hira #漢字をひらがなにして格納
    elsif @card.title.is_kana? #カタカナを見つけ出す
      @card.conversion_title = NKF.nkf('-w -X', @card.title).to_hira #カタカナをひらがなにして格納
    else
      @card.conversion_title = @card.title
    end

    if @card.save
      flash[:notice] = "投稿しました。"
      redirect_to public_card_path(@card.id)
    else
      flash.now[:alert] = "投稿に失敗しました。"
      render :new
    end
  end

  def show
    @card = Card.new # モーダル用
    @card = Card.find(params[:id])
    @card_comment = CardComment.new
    @card_comments = CardComment.all
  end

  def edit
    @card = Card.find(params[:id])
  end

  def update
    @card = Card.find(params[:id])
    if @card.update(card_params)
      flash[:notice] = "変更しました。"
      redirect_to public_card_path(@card.id)
    else
      flash.now[:alert] = "変更に失敗しました。"
      render :edit
    end
  end
  
  
  
  

  private

  def card_params
    params.require(:card).permit(:rarity_id, :store_id, :title, :body, :price, :is_active, :image)
  end

  def sort_order
    case params[:sort_by]
    when 'latest'
      :latest
    when 'old'
      :old
    when 'high_price'
      :high_price
    when 'low_price'
      :low_price
    else
      :latest
    end
  end

  def correct_customer
    @card = Card.find(params[:id])
    @customer = @card.customer
    redirect_to(public_cards_path) unless @customer == current_customer
  end


  def nul_card
    @card = Card.find_by(id: params[:id])
    if @card.nil? || (!@card.is_active && current_customer != @card.customer)
      render 'layouts/notfind'
    end
  end
end
