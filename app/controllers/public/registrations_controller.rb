# frozen_string_literal: true

class Public::RegistrationsController < Devise::RegistrationsController
 before_action :configure_sign_up_params, only: [:create,:update]
 before_action :authenticate_customer!

  def after_sign_up_path_for(resource)
    public_customers_path
  end

  def new
    @raritys = Rarity.all
    @stores = Store.all
    super
  end


  def customer_params
    params.require(:customer).permit(:name, :email, :password, :password_confirmation)
  end

end
