class Admin::ContactsController < ApplicationController
  before_action :authenticate_admin!
  before_action :nul_contact, only: [:edit, :update, :show]

  def index
    @contacts = Contact.all
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
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

  def nul_contact
    if params[:id]
      @contact = Contact.find_by(id: params[:id])
      if @contact.nil?
        render 'layouts/notfind'
      end
    end
  end
end
