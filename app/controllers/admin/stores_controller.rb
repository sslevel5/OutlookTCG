class Admin::StoresController < ApplicationController
  before_action :authenticate_admin!
  before_action :nul_store, only: [:edit, :update]

  def index
    @stores = Store.all
    @store = Store.new
  end

  def show
    @stores = Store.all
    redirect_to edit_admin_store_path(params[:id])
  end

  def create
    @store = Store.new(store_params)
    @stores = Store.all
    if @store.save
      flash[:notice] = "店舗名を追加しました。"
      redirect_to admin_stores_path
    else
      flash.now[:alert] = "店舗名の追加に失敗しました。"
      render :index
    end
  end

  def edit
    @stores = Store.all
    @store = Store.find(params[:id])
  end

  def update
    @stores = Store.all
    @store = Store.find(params[:id])
    if @store.update(store_params)
      flash[:notice] = "店舗名を変更しました。"
      redirect_to admin_stores_path
    else
      flash.now[:alert] = "店舗名の変更に失敗しました。"
      render :edit
    end
  end

  private

  def store_params
    params.require(:store).permit(:name)
  end

  def nul_store
    if params[:id]
      @store = Store.find_by(id: params[:id])
      if @store.nil?
        render 'layouts/notfind'
      end
    end
  end
end
