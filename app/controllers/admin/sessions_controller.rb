class Admin::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]
  before_action :redirect_if_user_logged_in, only: [:new, :create]

  def new
    @raritys = Rarity.all
    @stores = Store.all
    super
  end

  def after_sign_in_path_for(resource)
    admin_cards_path
  end

  def after_sign_out_path_for(resource)
    new_admin_session_path
  end

  private

  def redirect_if_user_logged_in
    redirect_to admin_cards_path if customer_signed_in?
  end

  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  end
end
