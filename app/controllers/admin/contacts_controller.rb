class Admin::ContactsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @raritys = Rarity.all
    @stores = Store.all
    @contacts = Contact.all
  end

  def show
    @raritys = Rarity.all
    @stores = Store.all
    @contact = Contact.find(params[:id])
  end

  def edit
    @raritys = Rarity.all
    @stores = Store.all
    @contact = Contact.find(params[:id])
  end

  def update
    @raritys = Rarity.all
    @stores = Store.all
    @contact = Contact.find(params[:id])
    if @contact.update(contact_params)
     flash[:notice] = "状態を変更しました。"
     redirect_to admin_contact_path(@contact)
    else
     flash.now[:alert] = "状態の変更に失敗しました。"
     render :edit
    end
  end


  private

  def contact_params
    params.require(:contact).permit(:title, :message, :is_active)
  end

end
