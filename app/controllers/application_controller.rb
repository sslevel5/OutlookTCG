class ApplicationController < ActionController::Base
  before_action :set_common_variables

  # 404エラーのハンドリング
  rescue_from ActionController::RoutingError, with: :render_404

  private

  def set_common_variables
    @raritys = Rarity.all
    @stores = Store.all
  end

  def render_404
    render file: "#{Rails.root}/public/404.html", layout: false, status: :not_found
  end
end
