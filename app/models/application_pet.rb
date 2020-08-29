class ApplicationPet < ApplicationRecord
  belongs_to :application
  belongs_to :pet

  def self.get_distinct_applied_pets
    ApplicationPet.pluck(:pet_id).flatten.uniq
  end
end
