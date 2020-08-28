require "rails_helper"

RSpec.describe Application, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :address}
    it {should validate_presence_of :city}
    it {should validate_presence_of :state}
    it {should validate_presence_of :zip}
    it {should validate_presence_of :phone_num}
    it {should validate_presence_of :description}
    it {should validate_presence_of :pets}

  end

end
