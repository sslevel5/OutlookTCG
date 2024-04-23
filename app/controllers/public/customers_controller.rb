class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  before_action :correct_customer
  before_action :check_authorization, only: [:edit, :update]

  def show
    @raritys = Rarity.all
    @stores = Store.all
    @customer = Customer.find(params[:id])
    @cards = Card.all
  end

  def edit
    @raritys = Rarity.all
    @stores = Store.all
    @customer = Customer.find(params[:id])
  end

  def update
    @raritys = Rarity.all
    @stores = Store.all
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to public_customer_path(@customer), notice: "登録情報が更新されました。"
    else
      render :edit
    end
  end

  def unsubscribe
    @customer = current_customer
    @raritys = Rarity.all
    @stores = Store.all
  end

  def withdraw
    @customer = current_customer
    @raritys = Rarity.all
    @stores = Store.all
    @customer.update(is_deleted: true, is_active: false) # 会員ステータスを退会に変更
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:name ,:profile_image ,:introduction ,:email, :password, :password_confirmation)
  end

  def check_authorization
    @customer = Customer.find(params[:id])
    if (@customer.id != current_customer.id) || (@customer.email == Customer::GUEST_USER_EMAIL )
      redirect_to public_customer_path(@customer)
    end
  end

  def correct_customer
    if params[:id]
      @customer = Customer.find_by(id: params[:id])
      if @customer == nil
        @raritys = Rarity.all
        @stores = Store.all
        render 'layouts/notfind'
      end
    end
  end

end
