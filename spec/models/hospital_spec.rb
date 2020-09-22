require 'rails_helper'

RSpec.describe Hospital do
  describe 'Relationships' do
    it {should have_many :doctors}
  end

  describe 'Validations' do
    it {should validate_presence_of :name}
  end
end
