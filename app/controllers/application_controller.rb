class ApplicationController < ActionController::Base
  before_action :set_common_variables
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound, with: :render_404
  rescue_from ActionController::RoutingError, with: :render_404


  def render_404(exception = nil)
    if exception
      logger.info "Rendering 404 with exception: #{exception.message}"
    end
    render template: "errors/error_404", status: 404, layout: 'notfind'
  end



  private

  def set_common_variables
    @raritys = Rarity.all
    @stores = Store.all
  end
end