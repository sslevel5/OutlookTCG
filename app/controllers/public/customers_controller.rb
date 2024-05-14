class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  before_action :correct_customer
  before_action :check_authorization, only: [:edit, :update]

  def show
    @customer = Customer.find(params[:id])
    favorites = Favorite.where(customer_id: @customer.id).pluck(:card_id)
    @favorite_cards = Card.where(id: favorites, is_active: true)
    if current_customer == @customer  # もし投稿主の場合
      @cards = @customer.cards # すべてのカードを表示
    else  # 投稿主でない場合
      @cards = @customer.cards.where(is_active: true)  # アクティブなカードのみ表示
    end
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "登録情報が更新されました。"
      redirect_to public_customer_path(@customer)
    else
      flash[:alert] = "登録情報が更新に失敗しました。"
      render :edit
    end
  end

  def unsubscribe
    @customer = current_customer
  end

  def withdraw
    @customer = current_customer
    withdrew_email = "withdrew_" + Time.now.to_i.to_s + @customer.email
    @customer.update(email: withdrew_email, is_active: false) # 会員ステータスを退会に変更
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:name ,:profile_image ,:introduction ,:email, :password, :password_confirmation, :is_active)
  end

  def check_authorization
    @customer = Customer.find(params[:id])
    if (@customer.id != current_customer.id) || (@customer.email == Customer::GUEST_USER_EMAIL)
      redirect_to public_customer_path(@customer)
    end
  end

  def correct_customer
    if params[:id]
      @customer = Customer.find_by(id: params[:id])
      if @customer.nil? || !@customer.is_active
        render 'layouts/notfind'
      end
    end
  end
end
