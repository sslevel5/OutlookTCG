class Public::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]
  before_action :authenticate_customer!
  before_action :redirect_if_admin_logged_in, only: [:new, :create]

  def after_sign_in_path_for(resource)
     home_path
  end

  def after_sign_out_path_for(resource)
     root_path
  end

  def new
    @raritys = Rarity.all
    @stores = Store.all
    super
  end

  private

  def redirect_if_admin_logged_in
    redirect_to home_path if admin_signed_in?
  end

  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
  end
end
