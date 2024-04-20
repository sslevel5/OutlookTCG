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
  end

  def update

  end


  private

  def contact_params
    params.require(:contact).permit(:title, :message)
  end

end
