class Customers::SessionsController < Devise::SessionsController
  def guest_sign_in
    customer = Customer.guest
    sign_in customer
    flash[:notice] = "ゲストでログインしました。"
    redirect_to public_customer_path(customer)
  end
end