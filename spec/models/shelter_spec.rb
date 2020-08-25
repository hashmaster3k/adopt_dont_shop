# spec/models/shelter_spec.rb

require 'rails_helper'

RSpec.describe Shelter, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it { should have_many :pets }
  end

  describe 'relationships' do
    it { should have_many :reviews }
  end

end
