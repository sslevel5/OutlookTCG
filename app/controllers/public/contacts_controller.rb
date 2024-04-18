class Public::ContactsController < ApplicationController
  before_action :authenticate_customer!
  # before_action :correct_customer

  def new
    @raritys = Rarity.all
    @stores = Store.all
    @contact = Contact.new
  end

  def confirm
    @raritys = Rarity.all
    @stores = Store.all
    @contact = Contact.new(contact_params)
    render :confim
  end

  def create
    @raritys = Rarity.all
    @stores = Store.all
    @contact = Contact.new(contact_params)
    @contact.save
    redirect_to home_path
  end

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

  def sent
    @raritys = Rarity.all
    @stores = Store.all
  end


  private

  def contact_params
    params.require(:contact).permit(:customer_id, :title, :message, :is_active)
  end

  # def correct_customer
  #   @contact = Contact.find(params[:id])
  #   @customer = @contact.customer
  #   redirect_to(home_path) unless @customer == current_customer
  # end

end
