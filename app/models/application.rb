class Application < ApplicationRecord
  validates_presence_of :name, :address, :city, :state, :zip, :phone_num, :description, :pets
end
