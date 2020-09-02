class ApplicationController < ActionController::Base
  helper_method :favorite

  def favorite
    @favorite ||= Favorite.new(session[:favorites])
  end

  def grab_empty_keys
    keys = []
    params.each do |key, value|
      keys << key if value.empty?
    end
    keys
  end
end
