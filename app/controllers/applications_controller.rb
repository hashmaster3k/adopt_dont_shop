class ApplicationsController < ApplicationController
  def new
    @favorites = Favorite.find_by_id
  end

  def create
    require "pry"; binding.pry
  end
end
