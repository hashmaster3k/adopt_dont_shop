class Application < ApplicationRecord
  validates_presence_of :name, :address, :city, :state, :zip, :phone_num, :description
  has_many :application_pets
  has_many :pets, through: :application_pets

  def self.get_distinct_applied_pets
    Application.pluck(:pet_ids).flatten.uniq
  end

  def self.num_of_applications
    Application.count
  end
end
