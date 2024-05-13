class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  before_action :nul_customer, only: [:edit, :update, :show]

  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "顧客情報が正常に更新されました"
      redirect_to admin_customer_path(@customer)
    else
      flash.now[:alert] = "顧客情報の更新に失敗しました。"
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name ,:profile_image ,:introduction ,:email, :password, :password_confirmation, :is_active)
  end

  def nul_customer
    if params[:id]
      @customer = Customer.find_by(id: params[:id])
      if @customer.nil?
        render 'layouts/notfind'
      end
    end
  end
end
