class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_customer, only: [:edit, :update, :unsubscribe, :withdraw]

  def show
    @raritys = Rarity.all
    @stores = Store.all
    @customer = Customer.find(params[:id])
    @cards = Card.all
  end

  def edit
    # ログインユーザーと編集しようとしているユーザーが一致するか確認
    unless current_customer == @customer
      redirect_to public_customer_path(@customer), alert: "他のユーザーの情報を編集することはできません。"
    end
    @raritys = Rarity.all
    @stores = Store.all
  end

  def update
    # ログインユーザーと編集しようとしているユーザーが一致するか確認
    unless current_customer == @customer
      redirect_to public_customer_path(@customer), alert: "他のユーザーの情報を編集することはできません。"
      return
    end

    @raritys = Rarity.all
    @stores = Store.all
    if @customer.update(customer_params)
      redirect_to public_customer_path(@customer), notice: "登録情報が更新されました。"
    else
      render :edit
    end
  end

  def unsubscribe
  end

  def withdraw
    # ログインユーザーと編集しようとしているユーザーが一致するか確認
    unless current_customer == @customer
      redirect_to public_customer_path(@customer), alert: "他のユーザーの情報を編集することはできません。"
      return
    end

    @raritys = Rarity.all
    @stores = Store.all
    @customer.update(is_deleted: true, is_active: false) # 会員ステータスを退会に変更
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :profile_image, :introduction, :email, :password, :password_confirmation)
  end

  def set_customer
    @customer = Customer.find(params[:id])
  end

end
