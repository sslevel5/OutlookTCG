class ApplicationController < ActionController::Base
  before_action :set_common_variables

  # 404エラーのハンドリング
  rescue_from ActionController::RoutingError, with: :render_not_found


  def render_not_found
    render file: "#{Rails.root}/portfolio/app/views/layouts/notfind.html.erb", layout: false, status: :not_found
  end

  private

  def set_common_variables
    @raritys = Rarity.all
    @stores = Store.all
  end
end
