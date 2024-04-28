class Admin::RaritysController < ApplicationController
  before_action :authenticate_admin!
  before_action :nul_rarity, only: [:edit, :update]

  def index
    @raritys = Rarity.all
    @rarity = Rarity.new
  end

  def show
    @raritys = Rarity.all
    redirect_to edit_admin_rarity_path(params[:id])
  end

  def create
    @rarity = Rarity.new(rarity_params)
    @raritys = Rarity.all
    if @rarity.save
      flash[:notice] = "レアリティを追加しました。"
      redirect_to admin_raritys_path
    else
      flash.now[:alert] = "レアリティの追加に失敗しました。"
      render :index
    end
  end

  def edit
    @raritys = Rarity.all
    @rarity = Rarity.find(params[:id])
  end

  def update
    @raritys = Rarity.all
    @rarity = Rarity.find(params[:id])
    if @rarity.update(rarity_params)
      flash[:notice] = "レアリティを変更しました。"
      redirect_to admin_raritys_path
    else
      flash.now[:alert] = "レアリティの変更に失敗しました。"
      render :edit
    end
  end

  private

  def rarity_params
    params.require(:rarity).permit(:name)
  end

  def nul_rarity
    if params[:id]
      @rarity = Rarity.find_by(id: params[:id])
      if @rarity.nil?
        render 'layouts/notfind'
      end
    end
  end
end
