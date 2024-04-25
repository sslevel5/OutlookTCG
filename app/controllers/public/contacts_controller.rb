class Public::ContactsController < ApplicationController
  before_action :authenticate_customer!
  before_action :correct_customer

  def new
    @contact = Contact.new(session[:contact_params]) || Contact.new
  end

  def confirm
    @contact = Contact.new(contact_params)
    session[:contact_params] = contact_params
    render :confirm
  end

  def create
    @contact = Contact.new(session[:contact_params])
    @contact.customer_id = current_customer.id
    if @contact.save
      session[:contact_params] = nil # セッションの入力情報をクリア
      flash[:notice] = "送信しました。"
      redirect_to confirm_send_public_contacts_path
    else
      flash.now[:alert] = "送信に失敗しました。"
      render :new
    end
  end

  def confirm_send
    @contact = Contact.last
  end

  def index
    @customer = current_customer
    @contacts = current_customer.contacts
  end

  def show
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
