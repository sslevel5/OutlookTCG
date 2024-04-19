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
    render :confirm
  end

  def create
    @raritys = Rarity.all
    @stores = Store.all
    @contact = Contact.new(contact_params)
    @contact.customer_id = current_user.id
    if @contact.save
      redirect_to root_path
    else
      render :new
    end
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

  def confirm_send
    @contact = Contact.new(contact_params)
    if @contact.save
      # ここで管理者にメール送信等の処理を行う
      redirect_to completed_contacts_path
    else
      render :confirm
    end
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
