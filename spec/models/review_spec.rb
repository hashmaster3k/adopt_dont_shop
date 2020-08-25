# spec/models/review_spec.rb

require 'rails_helper'

RSpec.describe Review do

  describe 'relationships' do
    it {should belong_to :shelter}
  end

end
