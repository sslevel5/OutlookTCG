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
    render file: Rails.public_path.join('404.html'), status: :not_found, layout: false
  end
end
