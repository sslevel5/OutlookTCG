class Public::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]
  before_action :authenticate_customer!
  before_action :redirect_if_admin_logged_in, only: [:new, :create]
  before_action :check_customer_active, only: [:create]

  def after_sign_in_path_for(resource)
    home_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  private

  def redirect_if_admin_logged_in
    redirect_to home_path if admin_signed_in?
  end

  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
  end

  def check_customer_active
    @customer = Customer.find_by(email: params[:customer][:email])
    #byebug
    if !@customer.is_active
      reset_session
      flash[:alert] = "アカウントが無効です。管理者にお問い合わせください。"
      redirect_to new_customer_session_path
    end
  end
end
