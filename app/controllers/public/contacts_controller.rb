class Public::ContactsController < ApplicationController
  before_action :authenticate_customer!
  before_action :correct_customer

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
    @contact.customer_id = current_customer.id
    if @contact.valid?
      @contact.save
      redirect_to confirm_send_public_contacts_path
    else
      render :new
    end
  end

  def confirm_send
    @raritys = Rarity.all
    @stores = Store.all
    @contact = Contact.last
  end

  def index
    @raritys = Rarity.all
    @stores = Store.all
    @customer = current_customer
    @contacts = current_customer.contacts
  end

  def show
    @raritys = Rarity.all
    @stores = Store.all
    @contact = Contact.find(params[:id])
  end

  private

  def contact_params
    params.require(:contact).permit(:title, :message)
  end

  def correct_customer
    if params[:id]
      # @contact = Contact.find(params[:id])
      @contact = Contact.find_by(id: params[:id])
      if @contact == nil
        @raritys = Rarity.all
      @stores = Store.all
        # @customer = nil
        render 'layouts/notfind'
        return
      else
        @customer = @contact.customer
      end
      redirect_to(public_contacts_path) unless @customer == current_customer
    end
  end

end
