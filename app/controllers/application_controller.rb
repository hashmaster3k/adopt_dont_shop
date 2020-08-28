class ApplicationController < ActionController::Base
  helper_method :favorite

  def favorite
    @favorite ||= Favorite.new(session[:favorites])
  end
end
