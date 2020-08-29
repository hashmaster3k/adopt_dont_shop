class Application < ApplicationRecord
  validates_presence_of :name, :address, :city, :state, :zip, :phone_num, :description, :pets

  def self.get_distinct_applied_pets
    Application.pluck(:pets).flatten.uniq
  end
end
