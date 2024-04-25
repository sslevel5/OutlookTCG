class ApplicationController < ActionController::Base
    before_action :set_common_variables

  private

  def set_common_variables
    @raritys = Rarity.all
    @stores = Store.all
  end
end
