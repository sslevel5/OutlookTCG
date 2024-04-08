class Public::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create, :update]
  before_action :authenticate_customer!
  before_action :redirect_if_admin_logged_in, only: [:new, :create]

  def after_sign_up_path_for(resource)
    public_customers_path
  end

  def new
    @raritys = Rarity.all
    @stores = Store.all
    super
  end

  private

  def redirect_if_admin_logged_in
    redirect_to admin_cards_path if admin_signed_in?
  end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation])
  end
end
