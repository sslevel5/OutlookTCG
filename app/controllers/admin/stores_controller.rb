class Admin::StoresController < ApplicationController
before_action :authenticate_admin!

  def index
    @stores = Store.all
    @store = Store.new
  end

  def show
    redirect_to edit_admin_store_path(params[:id])
  end

  def create
    @store = Store.new(store_params)
    @stores = Store.all
    if @store.save
      flash[:notice] = "ジャンルを追加しました。"
      redirect_to admin_stores_path
    else
      flash.now[:alert] = "ジャンルの追加に失敗しました。"
      render :index
    end
  end

  def edit
    @store = Store.find(params[:id])
  end


  def update
    @store = Store.find(params[:id])
    if @store.update(store_params)
      flash[:notice] = "ジャンルを変更しました。"
      redirect_to admin_stores_path
    else
      flash.now[:alert] = "ジャンルの変更に失敗しました。"
      render :edit
    end
  end


private

  def store_params
    params.require(:store).permit(:name)
  end
end
